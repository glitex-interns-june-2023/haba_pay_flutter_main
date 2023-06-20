import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/components/dashboard.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({super.key});

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
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
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Code",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder()
              ),
            ),
          ),
          const Spacer(flex: 4,),
          const Text(
            "A verification code was sent \n"
                "to your sms",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54
            ),
          ),
          Padding(padding: const EdgeInsets.all(16),
            child: MaterialButton(onPressed: (){
              Get.to(()=> Dashboard(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 1)
              );
            },
                height: 50,
                minWidth: double.infinity,
                color: Colors.orange,
                child: const Text(
                  "Verify",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
