import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:get/get.dart';

import '../../dashboard/components/dashboard.dart';

final CustomTheme theme = CustomTheme();

class VerificationSuccessfulPhoneSettings extends StatelessWidget {
  const VerificationSuccessfulPhoneSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Verifying number"),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(),
                          const Text(
                            "Verification successful",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset('assets/images/smile_face.svg'),
                          const Spacer(),
                          const Text(
                            "You have added 0788787887 \n"
                            "to your account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                          MaterialButton(
                              onPressed: () {
                                Get.offAll(
                                      () => const Dashboard(), transition: Transition.rightToLeft,
                                );
                              },
                              height: 50,
                              minWidth: double.infinity,
                              color: theme.orange,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50),
                                child: Text(
                                  "Go to Home",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: theme.white,
                                      fontSize: 20),
                                ),
                              )),
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
