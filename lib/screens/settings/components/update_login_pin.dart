import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:get/get.dart';

import 'add_phone_number_settings.dart';

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
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Current pin",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Obx(
                          () => TextField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            obscureText: settingsController.obscurePin[0],
                            cursorColor: theme.orange,
                            controller: settingsController.currentPinController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      settingsController.onObscurePin(0);
                                    },
                                    icon: !settingsController.obscurePin[0]
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                suffixIconColor: theme.orange,
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: theme.orange)),
                                errorText: settingsController
                                        .currentPinError.isNotEmpty
                                    ? settingsController.currentPinError.value
                                    : null),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "New pin",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Obx(
                          () => TextField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            obscureText: settingsController.obscurePin[1],
                            cursorColor: theme.orange,
                            controller: settingsController.newPinController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      settingsController.onObscurePin(1);
                                    },
                                    icon: !settingsController.obscurePin[1]
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                suffixIconColor: theme.orange,
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: theme.orange)),
                                errorText:
                                    settingsController.newPinError.isNotEmpty
                                        ? settingsController.newPinError.value
                                        : null),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Confirm pin",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Obx(
                          () => TextField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            obscureText: settingsController.obscurePin[2],
                            controller: settingsController.confirmPinController,
                            cursorColor: theme.orange,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      settingsController.onObscurePin(2);
                                    },
                                    icon: !settingsController.obscurePin[2]
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off)),
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: theme.orange)),
                                errorText: settingsController
                                        .confirmPinError.isNotEmpty
                                    ? settingsController.confirmPinError.value
                                    : null),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                            title: "Update",
                            onClick: () {
                              settingsController.onUpdatePinClicked();
                            }),
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
