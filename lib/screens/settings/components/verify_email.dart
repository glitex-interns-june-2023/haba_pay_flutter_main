import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/screens/settings/controller/settings_controller.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final SettingsController settingsController = Get.put(SettingsController());

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
                      const Text(
                        "Verify your email",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Divider(),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/images/verify_email.svg',
                        color: Colors.orange,
                      ),
                      const Spacer(),
                      Obx(() => !settingsController.isEmailSend.value
                          ? const Text(
                              "We will send you a verification link \n at brian@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18
                        ),
                      )
                          : const Text(
                          "Click the link send to \n brian@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18
                        ),
                      )),
                      const Spacer(
                        flex: 2,
                      ),
                      Obx(
                        () => !settingsController.isEmailSend.value
                            ? MaterialButton(
                                onPressed: () {
                                  settingsController.sendEmail();
                                },
                                height: 50,
                                minWidth: double.infinity,
                                color: Colors.orange,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: Text(
                                    "Get link",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ))
                            : MaterialButton(
                                onPressed: () {},
                                height: 50,
                                minWidth: double.infinity,
                                color: Colors.orange,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  child: Text(
                                    "Go to Home",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                )),
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
