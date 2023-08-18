import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';

import '../../dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

final CustomTheme theme = CustomTheme();

class UpdateLoginPin extends StatelessWidget {
  const UpdateLoginPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Change login pin"),
      backgroundColor: theme.background,
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(children: [
                      const Spacer(),
                      const Text(
                        "Update login pin",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 20,),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Current pin",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ),
                      const Padding(
                          padding: EdgeInsets.all(16),
                          child: TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          )),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot pin",
                                style: TextStyle(
                                    color: theme.orange,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "New pin",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ),
                      const Padding(
                          padding: EdgeInsets.all(16),
                          child: TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          )),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Confirm pin",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                      ),
                      const Padding(
                          padding: EdgeInsets.all(16),
                          child: TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          )),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: MaterialButton(
                          onPressed: () {},
                          height: 50,
                          minWidth: double.infinity,
                          color: theme.orange,
                          child: Text(
                            "Update",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: theme.white),
                          ),
                        ),
                      ),
                      const Spacer()
                    ]),
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
