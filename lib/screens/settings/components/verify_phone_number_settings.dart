import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';

import 'package:get/get.dart';
import 'package:haba_pay_main/screens/settings/components/verification_successful_phone_settings.dart';

final CustomTheme theme = CustomTheme();
final TextEditingController _codeController = TextEditingController();

class VerifyPhoneNumberSettings extends StatelessWidget {
  const VerifyPhoneNumberSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Verify number"),
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
                            "Verify phone number",
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
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Code",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            cursorColor: theme.orange,
                            keyboardType: TextInputType.number,
                            controller: _codeController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: theme.orange)),
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                          const Text(
                            "A verification was sent \n"
                            "to your sms",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Get.to(
                                  () =>
                                      const VerificationSuccessfulPhoneSettings(),
                                  transition: Transition.rightToLeft);
                            },
                            height: 50,
                            minWidth: double.infinity,
                            color: theme.orange,
                            child: Text(
                              "Verify",
                              style: TextStyle(
                                fontSize: 18,
                                color: theme.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
