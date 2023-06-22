import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/sign_up/components/verify_phone_number.dart';
import 'package:haba_pay_main/services/otp_service.dart';
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset('assets/images/add_phone_number_progress.png'),
          const Spacer(),
          const Text(
            "Add phone number",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Phone",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: _phoneNumberController,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MaterialButton(
                onPressed: () {
                  sendOtp(context, _phoneNumberController.text);
                },
                height: 50,
                minWidth: double.infinity,
                color: Colors.orange,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Add",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                )),
          ),
          const Spacer()
        ],
      ),
    );
  }

  /// sends OTP
  void sendOtp(BuildContext context, phoneNumber) async {
    showLoadingDialog(context);
    String verificationSid = await OTP.sendOTP(phoneNumber);

    if (verificationSid == "") {
      // ignore: use_build_context_synchronously
      hideLoadingDialog(context);
      // could not send OTP
      debugPrint("Could not send OTP");
      return;
    }

    // OTP sent success.
    // save token to storage
    const storage = FlutterSecureStorage();

    await storage.write(key: "verificatonSid", value: verificationSid);
    await storage.write(key: "phoneNumber", value: phoneNumber);

    // Next page to verify OTP
    Get.to(() => const VerifyPhoneNumber(),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1));
    debugPrint("OTP sent successfully");
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
