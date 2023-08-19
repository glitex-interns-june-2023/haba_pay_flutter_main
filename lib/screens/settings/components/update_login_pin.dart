import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/settings/components/pin_updated.dart';

import '../../dashboard/controller/dashboard_controller.dart';
import 'package:get/get.dart';

final CustomTheme theme = CustomTheme();
final TextEditingController _currentPinController = TextEditingController();
final TextEditingController _newPinController = TextEditingController();
final TextEditingController _confirmPinController = TextEditingController();

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
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
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
                          child: Text(
                            "Current pin",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                         TextField(
                           cursorColor: theme.orange,
                           controller: _currentPinController,
                           decoration:
                               InputDecoration(
                                 border: const OutlineInputBorder(),
                                 focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(
                                         color: theme.orange
                                     )
                                 ),
                               ),
                         ),
                        const SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "Forgot pin",
                              style: TextStyle(
                                  color: theme.orange,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "New pin",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                         TextField(
                           cursorColor: theme.orange,
                           controller: _newPinController,
                           decoration:
                               InputDecoration(
                                 border: const OutlineInputBorder(),
                                 focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(
                                         color: theme.orange
                                     )
                                 ),
                               ),
                         ),
                        const SizedBox(height: 20,),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Confirm pin",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                         TextField(
                           controller: _confirmPinController,
                           cursorColor: theme.orange,
                           decoration:
                               InputDecoration(
                                 border: const OutlineInputBorder(),
                                 focusedBorder: OutlineInputBorder(
                                     borderSide: BorderSide(
                                         color: theme.orange
                                     )
                                 ),
                               ),
                         ),
                        const SizedBox(height: 20,),
                        MaterialButton(
                          onPressed: () {
                            Get.to(()=> const PinUpdated(), transition: Transition.rightToLeft);
                          },
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
                        const Spacer()
                      ]),
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
