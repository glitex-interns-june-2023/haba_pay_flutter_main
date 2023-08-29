import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';
import 'package:haba_pay_main/screens/sign_in/controller/sign_in_screen_controller.dart';

import '../../sign_up/components/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signInController = Get.put(SignInController());
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
                      "Sign in to account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child:
                          SvgPicture.asset('assets/images/undraw_sign_in.svg'),
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
                      style: TextStyle(color: theme.orange),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Obx(() =>
                            CustomButton(
                              isSvgVector: true,
                                svgVector: "assets/images/google_logo.svg",
                                isLoading: signInController.isLoading.value,
                                title: "Continue with Google", onClick: (){
                              signInController.login();
                            }),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Or ",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAll(
                              () => const SignUp(),
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: Text(
                            "create new account",
                            style: TextStyle(color: theme.orange, fontSize: 14),
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
