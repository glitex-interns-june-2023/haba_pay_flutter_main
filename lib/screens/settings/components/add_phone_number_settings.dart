import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/settings/components/verify_phone_number_settings.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/settings/controller/settings_controller.dart';

final SettingsController settingsController = Get.put(SettingsController());
final CustomTheme theme = CustomTheme();
final TextEditingController _phoneNumberController = TextEditingController();
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
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 20,),
                          const Divider(),
                          const SizedBox(height: 20,),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Phone",
                              style: TextStyle(
                                fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                           TextField(
                             cursorColor: theme.orange,
                             keyboardType: TextInputType.phone,
                             controller: _phoneNumberController,
                             decoration:  InputDecoration(
                               border: const OutlineInputBorder(),
                               focusedBorder: OutlineInputBorder(
                                   borderSide: BorderSide(
                                       color: theme.orange
                                   )
                               ),
                             ),
                           ),
                          const Spacer(
                            flex: 4,
                          ),
                          const SizedBox(height: 10,),
                          MaterialButton(
                            onPressed: () {
                              settingsController.verifyNumber(_phoneNumberController.text);
                              Get.to(()=> const VerifyPhoneNumberSettings(), transition: Transition.rightToLeft);},
                            height: 50,
                            minWidth: double.infinity,
                            color: theme.orange,
                            child: Text(
                              "Add",
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
