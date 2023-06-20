import 'package:flutter/material.dart';

class VerificationSuccessfulPhoneSettings extends StatelessWidget {
  const VerificationSuccessfulPhoneSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text(
                "Verification successful",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              const Spacer(),
              Image.asset('assets/images/smile_face.png'),
              const Spacer(),
              const Text(
                "You have added 0788787887 \n"
                  "to your account",
                textAlign: TextAlign.center,
              ),
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
        ),
      ),
    );
  }
}
