import 'package:flutter/material.dart';

class AddPhoneNumberSettings extends StatelessWidget {
  const AddPhoneNumberSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Column(
            children: [
              const Spacer(),
              const Text(
                  "Add Phone number",
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
              const Padding(padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              const Spacer(flex: 4,),
              Padding(
                padding: const EdgeInsets.all(16),
                child: MaterialButton(onPressed: (){
                  
                },
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.orange,
                  child: const Text(
                      "Add",
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
    );
  }
}
