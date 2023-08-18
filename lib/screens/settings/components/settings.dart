import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/settings/components/SingleSettingsText.dart';
import 'package:haba_pay_main/screens/settings/controller/settings_controller.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint){
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Profile settings",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(),
                          ),
                          const SingleSettingsText(title: "Brian Nakamoto", description: "Number : +254 789 890 890"),
                          const Divider(),
                          const SingleSettingsText(title: "Email", description: "briannakamoto@gmail.com"),
                          const Divider(),
                          const SingleSettingsText(title: "Location", description: "Machakos, kenya"),
                          const Divider(),
                          MaterialButton(onPressed: (){ settingsController.logout();},
                            child: const Text("Logout"),
                          )
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

