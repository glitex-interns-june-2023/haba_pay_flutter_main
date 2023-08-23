import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/sign_up/components/add_phone_number.dart';

final CustomTheme theme = CustomTheme();

class VerifyPhoneNumber extends StatelessWidget {
  const VerifyPhoneNumber({super.key});

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
                      SvgPicture.asset('assets/images/step_2.svg'),
                      const SizedBox(height: 20,),
                      const Text(
                        "Verify phone number",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Code",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Obx(() => TextField(
                        cursorColor: theme.orange,
                        keyboardType: TextInputType.number,
                        controller: signUpController.codeController,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: theme.orange)),
                            errorText: signUpController.codeError.isNotEmpty
                                ? signUpController.codeError.value
                                : null
                        ),
                      ),),
                      const Spacer(
                        flex: 4,
                      ),
                      const Text(
                        "A verification code was sent \n"
                            "to your sms",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18
                        ),
                      ),
                      const SizedBox(height: 20,),
                      CustomButton(title: "Verify", onClick: (){
                        signUpController.onVerifyClicked();
                      }),
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
}
