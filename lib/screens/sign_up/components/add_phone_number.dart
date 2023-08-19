import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/routes/app_page.dart';
import 'package:haba_pay_main/screens/sign_up/components/verify_phone_number.dart';
import 'package:haba_pay_main/screens/sign_up/controller/otp_controller.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  final CustomTheme theme = CustomTheme();
  final OtpController otpController = Get.put(OtpController());
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isLoading = false;
  bool isValid = true;
  String errorMsg = "Please enter your phone";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Spacer(),
                      SvgPicture.asset('assets/images/step_1.svg'),
                      const SizedBox(height: 20,),
                      const Text(
                        "Add phone number",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Phone",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: theme.orange
                                )
                            ),
                            errorText: !isValid ? errorMsg : null,
                          ),
                          cursorColor: theme.orange,
                          keyboardType: TextInputType.number,
                          controller: _phoneNumberController,
                        ),
                      ),
                      const Spacer(),
                      Visibility(
                        visible: isLoading,
                        replacement: const SizedBox(),
                        child: CircularProgressIndicator(
                          color: theme.orange,
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: MaterialButton(
                            onPressed: () {
                              Get.to(
                                    () => const VerifyPhoneNumber(),
                                transition: Transition.rightToLeft,
                              );
                              //sendOtp(_phoneNumberController.text);
                            },
                            height: 50,
                            minWidth: double.infinity,
                            color: theme.orange,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                isLoading ? "Sending..." : "Add",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: theme.white,
                                    fontSize: 20),
                              ),
                            )),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// sends OTP
  void sendOtp(phoneNumber) async {
    if (!validateInput()) return;

    setState(() {
      isLoading = true;
    });

    try {
      // OTP sent success.
      await otpController.sendOTP(phoneNumber);

      setState(() {
        isLoading = false;
      });

      // Next page to verify OTP
      Get.to(
        () => const VerifyPhoneNumber(),
        routeName: AppPage.getVerifyPhoneNumber(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 500),
      );

      debugPrint("OTP sent successfully");
    } catch (e) {
      debugPrint("Error trying to send OTP: $e");

      setState(() {
        isLoading = false;
        isValid = false;
        errorMsg = e.toString() == ""
            ? "Error sending verification code"
            : e.toString();
      });
    }
  }

  /// validate empty phone number
  bool validateInput() {
    final String phoneNumber = _phoneNumberController.text;
    bool valid = true;
    String error = "";
    if (phoneNumber.isEmpty) {
      error = "Please enter your phone";
      valid = false;
    } else if (phoneNumber.length < 10) {
      error = "Phone should be at least 10 digits";
      valid = false;
    }

    setState(() {
      errorMsg = error;
      isValid = valid;
    });

    return valid;
  }
}
