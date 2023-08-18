import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/routes/app_page.dart';
import 'package:haba_pay_main/screens/sign_up/components/verification_successful.dart';
import 'package:haba_pay_main/screens/sign_up/controller/otp_controller.dart';

import '../../dashboard/components/dashboard.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({super.key});

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  final OtpController otpController = Get.put(OtpController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool hasError = false;
  String errorMsg = "";
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
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
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            errorText: hasError ? errorMsg : null,
                          ),
                          validator: (String? value) {
                            if (value == null) {
                              return "Please enter code";
                            }
                            return null;
                          },
                          onSaved: ((value) => {otp = value ?? ""}),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Visibility(
                      visible: isLoading,
                      replacement: const SizedBox(),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                        ),
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
                          verifyOTP();
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
              ),
            ),
          );
        },
      ),
    );
  }

  /// verify otp
  void verifyOTP() async {
    // validate form input
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    try {
      setState(() {
        isLoading = true;
      });

      final response = otpController.verifyOTP(otp);
      debugPrint(response.toString());

      Get.to(
        () => const VerificationSuccessful(),
        routeName: AppPage.getVerificationSuccessful(),
        transition: Transition.rightToLeft,
      );
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
        errorMsg = e.toString();
      });
    }
  }
}
