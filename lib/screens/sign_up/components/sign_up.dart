import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sign_in/components/sign_in.dart';
import '../controller/sign_up_controller.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            const Spacer(),
            const Text(
              "Create new account",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
            const Spacer(),
            Padding(padding: const EdgeInsets.all(16)
              ,child: Image.asset('assets/images/undraw_sign_up.png'),
            ),
            const Spacer(),
            const Text(
              "Welcome to the convenience of payment \n"
                  "By continuing, you agree with our",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black54
              ),
            ),
            const Text(
              "terms & conditions",
              style: TextStyle(
                  color: Colors.orange
              ),
            ),
            const Spacer(),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() =>
                  MaterialButton(onPressed: (){ signUpController.signUp(); },
                      height: 50,
                      color: Colors.orange,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if(!signUpController.isLoading.value) const Image(image: AssetImage('assets/images/google_logo.png'))
                          else const Icon(Icons.refresh, color: Colors.white,),
                          const SizedBox(width: 5,),
                          const Text(
                            "Continue with Google",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20
                            ),
                          )
                        ],
                      )
                  )
                )
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account, "),
                const SizedBox(width: 5,),
                InkWell(
                  onTap: (){
                    Get.offAll(()=>const SignIn(), transition: Transition.rightToLeft,);
                  },
                  child: const Text(
                    "sign in",
                    style: TextStyle(
                        color: Colors.orange
                    ),
                  ),
                )
              ],
            ),
            const Spacer()
          ]
      ),
    );
  }
}

