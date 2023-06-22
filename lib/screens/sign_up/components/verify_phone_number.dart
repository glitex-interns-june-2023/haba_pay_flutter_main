// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/services/otp_service.dart';

import '../../dashboard/components/dashboard.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({super.key});

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  TextEditingController otpController = TextEditingController();

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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: otpController,
            ),
          ),
          const Spacer(
            flex: 4,
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
                verifyOTP(context, otpController.text);
              },
              height: 50,
              minWidth: double.infinity,
              color: Colors.orange,
              child: const Text(
                "Verify",
                style: TextStyle(
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
  void verifyOTP(BuildContext context, String otp) async {
    //get verification sid from storage
    const storage = FlutterSecureStorage();
    final String? verificationSid = await storage.read(key: "verificationSid");
    final String? phoneNumber = await storage.read(key: "phoneNumber");

    if (verificationSid == null || phoneNumber == null) {
      debugPrint(
          "Cannot process this request. Empty verificationSid or phone number");
      return;
    }

    showLoadingDialog(context);
    bool verificationSuccess =
        await OTP.verifyOTP(verificationSid, phoneNumber, otp);

    if (!verificationSuccess) {
      debugPrint("Invalid OTP.");
      hideLoadingDialog(context);
      return;
    }
    hideLoadingDialog(context);

    // clear storage
    await storage.delete(key: "verificationSid");
    await storage.delete(key: "phoneNumber");

    // OTP verified successfully. Move to Dashboard
    Get.to(
      () => const Dashboard(),
      transition: Transition.rightToLeft,
      duration: const Duration(seconds: 1),
    );
  }

  /// show loading modal
  void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(""),
            content: const CircularProgressIndicator(),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              )
            ],
          );
        });
  }

  /// hide loading dialog
  void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
