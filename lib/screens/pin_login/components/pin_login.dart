import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/pin_login/components/SingleButton.dart';

class PinLogin extends StatefulWidget {
  const PinLogin({super.key});

  @override
  State<PinLogin> createState() => _PinLoginState();
}

class _PinLoginState extends State<PinLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          const Text(
              "Good afternoon, Brian",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          const Spacer(),
          Row(),
          const Spacer(),
          Row(
            children: [
              SingleButton(
                number: "1",
                onPress: () {

                },
              )
            ],
          ),
          const Spacer(),
          Row(),
          const Spacer(),
          Row(),
          const Spacer(),
          Row(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: MaterialButton(onPressed: (){

            },
              minWidth: double.infinity,
              height: 50,
              color: Colors.orange,
              child: const Text(
                  "Log in",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  )
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
