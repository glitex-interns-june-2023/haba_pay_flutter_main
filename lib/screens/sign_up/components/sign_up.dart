import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';

import '../../sign_in/components/sign_in.dart';
import '../controller/sign_up_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signUpController = Get.put(SignUpController());
  final CustomTheme theme = CustomTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    const Spacer(),
                    const Text(
                      "Create new account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child:
                          SvgPicture.asset('assets/images/undraw_sign_up.svg'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Welcome to the convenience of payment \n"
                      "By continuing, you agree with our",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "terms & conditions",
                      style: TextStyle(fontSize: 14, color: theme.orange),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Obx(() => CustomButton(
                          isLoading: signUpController.isLoading.value,
                            isSvgVector: true,
                            svgVector: 'assets/images/google_logo.svg',
                            title: "Continue with Google",
                            onClick: () {
                              signUpController.signUp();
                            }))),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account, ",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(
                              () => const SignIn(),
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: Text(
                            "sign in",
                            style: TextStyle(fontSize: 14, color: theme.orange),
                          ),
                        )
                      ],
                    ),
                    const Spacer()
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
