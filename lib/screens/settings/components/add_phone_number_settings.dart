import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';

class AddPhoneNumberSettings extends StatelessWidget {
  const AddPhoneNumberSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Add new number"),
      body: LayoutBuilder(
        builder: (context, constraint) {
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
                          "Add Phone number",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Spacer(),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Phone",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
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
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: MaterialButton(
                            onPressed: () {},
                            height: 50,
                            minWidth: double.infinity,
                            color: theme.orange,
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: theme.white,
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
