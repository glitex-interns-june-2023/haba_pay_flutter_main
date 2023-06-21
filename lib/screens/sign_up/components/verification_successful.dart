import 'package:flutter/material.dart';

class VerificationSuccessful extends StatelessWidget {
  const VerificationSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Image.asset('assets/images/verification_successful_progress.png'),
          const SizedBox(height: 20,),
          const Text(
            "Verification successful",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          const Spacer(),
          Image.asset('assets/images/smile_face.png'),
          const Spacer(flex: 4,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MaterialButton(onPressed: (){},
                height: 50,
                minWidth: double.infinity,
                color: Colors.orange,
                child: const Padding(padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Start",
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