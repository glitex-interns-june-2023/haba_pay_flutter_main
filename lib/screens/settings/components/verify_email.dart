import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/settings/controller/settings_controller.dart';
import 'package:get/get.dart';

final CustomTheme theme = CustomTheme();
final SettingsController settingsController = Get.put(SettingsController());

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Verify email"),
      body: LayoutBuilder(builder: (context, constraint) {
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
                          "Verify your email",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        const Divider(),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/images/verify_email.svg',
                          color: theme.orange,
                        ),
                        const Spacer(),
                        Obx(() => !settingsController.isEmailSend.value
                            ? Text(
                                "We will send you a verification link \n at ${settingsController.userEmail.value}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                              )
                            : Text(
                                "Click the link send to \n ${settingsController.userEmail.value}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                              )),
                        const Spacer(
                          flex: 2,
                        ),
                        Obx(() => !settingsController.isEmailSend.value
                            ? CustomButton(
                                isLoading:
                                    settingsController.isSendingEmail.value,
                                title: "Get link",
                                onClick: () {
                                  settingsController.sendEmail();
                                })
                            : CustomButton(
                                title: "Go to Home",
                                onClick: () {
                                  settingsController.goToHome();
                                })),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
