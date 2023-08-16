import 'package:flutter/material.dart';

class PinUpdated extends StatelessWidget {
  const PinUpdated({super.key});

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
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Spacer(),
                          const Text(
                            "Pin updated",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Spacer(),
                          const Divider(),
                          const Spacer(),
                          Image.asset('assets/images/smile_face.png'),
                          const Spacer(),
                          const Text(
                            "Cheers!! To being safe \n"
                                "Please keep your PIN secret",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          const Spacer(flex: 4,),
                          MaterialButton(onPressed: (){

                          },
                            height: 50,
                            color: Colors.orange,
                            minWidth: double.infinity,
                            child: const Text(
                              "Return to home",
                              style: TextStyle(
                                fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
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
            ),
          );
        },
      ),
    );
  }
}
