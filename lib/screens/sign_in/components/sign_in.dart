import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/sign_in/controller/sign_in_screen_controller.dart';

import '../../sign_up/components/sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Spacer(),
        const Text(
          "Sign in to account",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset('assets/images/undraw_sign_in.png'),
        ),
        const Spacer(),
        const Text(
          "Welcome to the convenience of payment \n"
          "By continuing, you agree with our",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54),
        ),
        const Text(
          "terms & conditions",
          style: TextStyle(color: Colors.orange),
        ),
        const Spacer(),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(() => MaterialButton(
                onPressed: () { signInController.login(); },
                height: 50,
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(!signInController.isLoading.value) const Image(image: AssetImage('assets/images/google_logo.png'))
                    else const Icon(Icons.refresh, color: Colors.white,),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Continue with Google",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    )
                  ],
                )))),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Or "),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                Get.to(
                  () => const SignUp(),
                  transition: Transition.rightToLeft,
                );
              },
              child: const Text(
                "create new account",
                style: TextStyle(color: Colors.orange),
              ),
            )
          ],
        ),
        const Spacer()
      ]),
    );
  }
}
