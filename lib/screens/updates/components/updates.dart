import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import 'package:haba_pay_main/screens/Shared/description.dart';
import 'package:haba_pay_main/screens/Shared/title_text.dart';
import 'package:haba_pay_main/screens/updates/controller/updates_controller.dart';
import 'package:get/get.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  final UpdatesController updatesController = Get.put(UpdatesController());
  CustomTheme theme = CustomTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Spacer(),
                      const TitleText(title: "Check for updates"),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => updatesController.isLoading.value
                          ? CircularProgressIndicator(
                              color: theme.orange,
                            )
                          : SvgPicture.asset(
                          'assets/images/updates.svg',
                        color: theme.orange,
                      )),
                      const Spacer(),
                      const Description(
                          description:
                              "We are checking to see whether \n your app is up-to-date"),
                      const Spacer(
                        flex: 2,
                      ),
                      CustomButton(title: "Return to Home", onClick: () {}),
                      Row(
                        children: [
                          Obx(() => Checkbox(
                              value: updatesController.isChecked.value,
                              onChanged: (value) {
                                updatesController.onChanged(value!);
                              })),
                          const Text(
                            "Automatically install updates",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      const Spacer()
                    ],
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
