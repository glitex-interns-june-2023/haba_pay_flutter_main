// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/sign_up/components/verification_successful.dart';
import 'package:haba_pay_main/services/otp_service.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({super.key});

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  final TextEditingController _otpController = TextEditingController();

  bool isLoading = false;
  bool isValid = true;
  String errorMsg = "Please enter verification code";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset('assets/images/verify_phone_number_progress.png'),
          const Spacer(),
          const Text(
            "Verify phone number",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Code",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                errorText: !isValid ? errorMsg : null,
              ),
              keyboardType: TextInputType.number,
              controller: _otpController,
            ),
          ),
          const Spacer(),
          Visibility(
            visible: isLoading,
            replacement: const SizedBox(),
            child: const CircularProgressIndicator(
              color: Colors.orange,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const Text(
            "A verification code was sent \n"
            "to your sms",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: MaterialButton(
              onPressed: () {
                verifyOTP(_otpController.text);
              },
              height: 50,
              minWidth: double.infinity,
              color: Colors.orange,
              child: Text(
                isLoading ? "Verifying..." : "Verify",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }

  /// verfify if the code is go
  void verifyOTP(String otp) async {
    if (!validateInput()) return;

    //get verification sid from storage
    const storage = FlutterSecureStorage();
    final String? verificationSid = await storage.read(key: "verificationSid");
    final String? phoneNumber = await storage.read(key: "phoneNumber");

    if (verificationSid == null) {
      debugPrint("VerificationSid is null. Cannot process this request");

      setState(() {
        isValid = false;
        errorMsg =
            "Something is missing. Cannot process your request at the moment.";
      });

      return;
    }
    if (phoneNumber == null) {
      debugPrint("Phone number is null. Cannot process this request");

      setState(() {
        isValid = false;
        errorMsg = "Phone number is null. Cannot process this request";
      });

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      bool verificationSuccess =
          await OTP.verifyOTP(verificationSid, phoneNumber, otp);

      if (!verificationSuccess) {
        debugPrint("Invalid OTP.");
        setState(() {
          isLoading = false;
          isValid = false;
          errorMsg = "Invalid Code. Please try again";
        });
        return;
      }

      setState(() {
        isLoading = false;
        isValid = true;
      });

      // clear storage
      await storage.delete(key: "verificationSid");
      await storage.delete(key: "phoneNumber");

      // OTP verified successfully. Move to Dashboard
      Get.to(
        () => const VerificationSuccessful(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500),
      );
    } catch (e) {
      debugPrint("And error occurred processing your request: $e");
      setState(() {
        isValid = false;
        isLoading = false;
        errorMsg = e.toString();
      });
    }
  }

  /// validate empty phone number
  bool validateInput() {
    final bool valid = _otpController.text.isEmpty ? false : true;

    setState(() {
      isValid = valid;
    });

    return valid;
  }
}
