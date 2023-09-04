import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/add_business/components/add_business.dart';
import 'package:haba_pay_main/screens/faqs_and_tcs/components/faqs.dart';
import 'package:haba_pay_main/screens/faqs_and_tcs/components/tcs.dart';
import 'package:haba_pay_main/screens/settings/components/SingleSettingsButton.dart';
import 'package:haba_pay_main/screens/settings/components/SingleSettingsText.dart';
import 'package:haba_pay_main/screens/settings/components/add_phone_number_settings.dart';
import 'package:haba_pay_main/screens/settings/components/update_login_pin.dart';
import 'package:haba_pay_main/screens/settings/components/verify_email.dart';
import 'package:haba_pay_main/screens/settings/controller/settings_controller.dart';
import 'package:haba_pay_main/screens/share_app/components/share_app.dart';
import 'package:haba_pay_main/screens/statement_download/components/statement_download.dart';
import 'package:haba_pay_main/screens/updates/components/updates.dart';

final settingsController = Get.put(SettingsController());
final CustomTheme theme = CustomTheme();

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.white,
        title: Text(
          "Settings",
          style: TextStyle(color: theme.black),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                'assets/images/bell.svg',
                color: theme.black,
              ),
            ),
          ),
        ],
      ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Profile settings",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: theme.background,
                              child: Obx(
                                () => Text(
                                  settingsController.userNameInitials.value,
                                  style: TextStyle(color: theme.black),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => SingleSettingsText(
                                title: settingsController.userName.value,
                                description:
                                    "Number : ${settingsController.userNumber.value}"),
                          ),
                          const Divider(),
                          Obx(
                            () => SingleSettingsText(
                                title: "Email",
                                description:
                                    settingsController.userEmail.value),
                          ),
                          const Divider(),
                          Obx(
                            () => SingleSettingsText(
                                title: "Location",
                                description:
                                    settingsController.userLocation.value),
                          ),
                          const Divider(),
                          Obx(
                            () => ExpansionTile(
                              iconColor: theme.black,
                              textColor: theme.black,
                              onExpansionChanged: (expanded) {
                                settingsController.onIsMoreExpanded();
                              },
                              initiallyExpanded:
                                  settingsController.isMoreExpanded.value,
                              title: const Text(
                                "More Information",
                                style: TextStyle(fontSize: 18),
                              ),
                              children: [
                                SingleSettingsButton(
                                    icon: 'assets/images/verify_email.svg',
                                    title: "Verify your email",
                                    onClick: () {
                                      Get.to(() => const VerifyEmail(),
                                          transition: Transition.rightToLeft);
                                    }),
                                SingleSettingsButton(
                                    icon: 'assets/images/add_new_number.svg',
                                    title: "Add new number",
                                    onClick: () {
                                      Get.to(
                                          () => const AddPhoneNumberSettings(),
                                          transition: Transition.rightToLeft);
                                    }),
                                SingleSettingsButton(
                                    icon: 'assets/images/add_your_business.svg',
                                    title: "Add your business",
                                    onClick: () {
                                      Get.to(() => const AddBusiness(),
                                          transition: Transition.rightToLeft);
                                    }),
                                SingleSettingsButton(
                                    icon:
                                        'assets/images/download_my_statement.svg',
                                    title: "Download my statement",
                                    onClick: () {
                                      Get.to(() => const StatementDownload(),
                                          transition: Transition.rightToLeft);
                                    })
                              ],
                            ),
                          ),
                          const Divider(),
                          const Text(
                            "App settings",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SingleSettingsButton(
                              icon: 'assets/images/change_login_pin.svg',
                              title: "Change login PIN",
                              onClick: () {
                                Get.to(() => const UpdateLoginPin(),
                                    transition: Transition.rightToLeft);
                              }),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: SingleSettingsButton(
                                    icon: 'assets/images/quick_login.svg',
                                    title: "Quick login",
                                    onClick: () {}),
                              ),
                              Expanded(
                                child: Obx(
                                  () => Switch(
                                      activeColor: theme.orange,
                                      value: settingsController
                                          .isQuickLoginChecked.value,
                                      onChanged: (bool newValue) {
                                        settingsController
                                            .onQuickLoginChanged(newValue);
                                      }),
                                ),
                              )
                            ],
                          ),
                          SingleSettingsButton(
                              icon: 'assets/images/logout.svg',
                              title: "Logout",
                              onClick: () {
                                settingsController.logout();
                              }),
                          const Divider(),
                          const Text(
                            "About",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SingleSettingsButton(
                              icon: 'assets/images/call_support.svg',
                              title: "Call support",
                              onClick: () {}),
                          SingleSettingsButton(
                              icon: 'assets/images/faq.svg',
                              title: "FAQ",
                              onClick: () {
                                Get.to(() => const Faqs(),
                                    transition: Transition.rightToLeft);
                              }),
                          SingleSettingsButton(
                              icon: 'assets/images/share.svg',
                              title: "Share app",
                              onClick: () {
                                Get.to(() => const ShareApp(),
                                    transition: Transition.rightToLeft);
                              }),
                          SingleSettingsButton(
                              icon: 'assets/images/notes.svg',
                              title: "Terms and conditions",
                              onClick: () {
                                Get.to(() => const Tcs(),
                                    transition: Transition.rightToLeft);
                              }),
                          SingleSettingsButton(
                              icon: 'assets/images/update.svg',
                              title: "Check for updates",
                              onClick: () {
                                Get.to(() => const Updates(),
                                    transition: Transition.rightToLeft);
                              }),
                          SingleSettingsButton(
                              icon: 'assets/images/code.svg',
                              title: "About developer",
                              onClick: () {}),
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
