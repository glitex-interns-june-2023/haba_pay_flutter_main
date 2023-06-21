import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                const Text(
                    "Brian Nakamoto",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const Text(
                    "Number : +254 789 890 890",
                ),
                const Divider(),
                const Text(
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const Text(
                  "briannakamoto@gmail.com",
                ),
                const Divider(),
                const Text(
                  "Location",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                const Text(
                  "Machakos, kenya",
                ),
                const Divider(),
                MaterialButton(onPressed: (){ settingsController.logout();},
                  child: const Text("Logout"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
