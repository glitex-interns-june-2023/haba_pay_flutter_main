import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/settings/controller/settings_controller.dart';

final SettingsController settingsController = Get.put(SettingsController());
final CustomTheme theme = CustomTheme();

class AddPhoneNumberSettings extends StatelessWidget {
  const AddPhoneNumberSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Add new number"),
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
                      child: Column(
                        children: [
                          const Spacer(),
                          const Text(
                            "Add Phone number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Phone",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Obx(
                            () => TextField(
                              cursorColor: theme.orange,
                              keyboardType: TextInputType.phone,
                              controller:
                                  settingsController.phoneNumberController,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: theme.orange)),
                                  errorText: settingsController
                                          .phoneNumberError.isNotEmpty
                                      ? settingsController
                                          .phoneNumberError.value
                                      : null),
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              title: "Add",
                              onClick: () {
                                settingsController.onAddPhoneNumberClicked();
                              }),
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
