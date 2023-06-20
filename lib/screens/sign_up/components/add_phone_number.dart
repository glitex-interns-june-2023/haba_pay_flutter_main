import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/sign_up/components/verify_phone_number.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
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
                    "Phone",
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
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MaterialButton(onPressed: (){
              Get.to(()=>const VerifyPhoneNumber(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 1)
              );
            },
                height: 50,
                minWidth: double.infinity,
                color: Colors.orange,
                child: const Padding(padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Add",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                )
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
