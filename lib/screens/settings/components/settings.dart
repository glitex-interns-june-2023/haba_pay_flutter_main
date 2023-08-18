import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/settings/components/SingleSettingsButton.dart';
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
                              fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: theme.background,
                              child: Text(
                                  "BN",
                                style: TextStyle(
                                  color: theme.black
                                ),
                              ),
                            ),
                          ),
                          const SingleSettingsText(title: "Brian Nakamoto", description: "Number : +254 789 890 890"),
                          const Divider(),
                          const SingleSettingsText(title: "Email", description: "briannakamoto@gmail.com"),
                          const Divider(),
                          const SingleSettingsText(title: "Location", description: "Machakos, kenya"),
                          const Divider(),
                          Obx(() => ExpansionTile(
                            textColor: theme.black,
                            onExpansionChanged: (expanded){
                              settingsController.onIsMoreExpanded();
                            },
                              initiallyExpanded: settingsController.isMoreExpanded.value,
                              title: const Text(
                                "More Information",
                                style: TextStyle(
                                    fontSize: 18
                                ),
                              ),
                            children: [
                              SingleSettingsButton(icon: 'assets/images/verify_email.svg', title: "Verify your email", onClick: (){}),
                              SingleSettingsButton(icon: 'assets/images/add_new_number.svg', title: "Add new number", onClick: (){}),
                              SingleSettingsButton(icon: 'assets/images/add_your_business.svg', title: "Add your business", onClick: (){}),
                              SingleSettingsButton(icon: 'assets/images/download_my_statement.svg', title: "Download my statement", onClick: (){})
                            ],
                          ),),
                          const Divider(),
                          const Text(
                            "App settings",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SingleSettingsButton(icon: 'assets/images/change_login_pin.svg', title: "Change login PIN", onClick: (){}),
                          SingleSettingsButton(icon: 'assets/images/quick_login.svg', title: "Quick login", onClick: (){}),
                          SingleSettingsButton(icon: 'assets/images/logout.svg', title: "Logout", onClick: (){}),
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

