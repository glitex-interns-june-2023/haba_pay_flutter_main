import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/sign_up/controller/sign_up_controller.dart';

final CustomTheme theme = CustomTheme();
final SignUpController signUpController = Get.put(SignUpController());
class AddPhoneNumber extends StatelessWidget {
  const AddPhoneNumber({super.key});

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
                        child: Text(
                          "Phone",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Obx(() => TextField(
                        cursorColor: theme.orange,
                        keyboardType: TextInputType.phone,
                        controller: signUpController.phoneNumberController,
                        decoration:  InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: theme.orange
                              ),
                            ),
                            errorText: signUpController.phoneNumberError.isNotEmpty
                                ? signUpController.phoneNumberError.value
                                : null
                        ),
                      ),),
                      const Spacer(
                        flex: 2,
                      ),
                      const SizedBox(height: 20,),
                      CustomButton(
                        isLoading: signUpController.isPhoneNumberLoading.value,
                          title: "Add",
                          onClick: (){
                        signUpController.onAddClicked();
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
