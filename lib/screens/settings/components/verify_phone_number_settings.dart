import 'package:flutter/material.dart';

class VerifyPhoneNumberSettings extends StatelessWidget {
  const VerifyPhoneNumberSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint){
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const Spacer(),
                        const Text(
                          "Verify phone number",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                            decoration: InputDecoration(border: OutlineInputBorder()),
                          ),
                        ),
                        const Spacer(
                          flex: 4,
                        ),
                        const Text(
                          "A verification was sent \n"
                              "to your sms",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: MaterialButton(
                            onPressed: () {},
                            height: 50,
                            minWidth: double.infinity,
                            color: Colors.orange,
                            child: const Text(
                              "Verify",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
