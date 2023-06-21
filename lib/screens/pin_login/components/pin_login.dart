import 'package:flutter/material.dart';

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
          const Text("Good afternoon, Brian"),
          const Spacer(),
          Row(),
          const Spacer(),
          Row(),
          const Spacer(),
          Row(),
          const Spacer(),
          Row(),
          const Spacer(),
          Row(),
          const Spacer(),
          MaterialButton(onPressed: (){

          },
            height: 50,
            color: Colors.orange,
            child: const Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20
                )
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
