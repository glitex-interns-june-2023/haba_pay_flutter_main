import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/pin_login/components/single_button.dart';
import 'package:haba_pay_main/screens/pin_login/components/single_pin_field.dart';
import 'package:haba_pay_main/screens/pin_login/controllers/pin_login_controller.dart';

class ConfirmLoginPin extends StatefulWidget {
  const ConfirmLoginPin({super.key});

  @override
  State<ConfirmLoginPin> createState() => _ConfirmLoginPinState();
}

class _ConfirmLoginPinState extends State<ConfirmLoginPin> {
  final CustomTheme theme = CustomTheme();
  final pinLoginController = Get.put(PinLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Spacer(),
                      SvgPicture.asset('assets/images/step_3.svg'),
                      const SizedBox(height: 20,),
                      const Text(
                        "Repeat PIN to confirm",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Obx(() => Row(
                        children: [
                          const Spacer(),
                          if (pinLoginController.pin.isNotEmpty)
                             SinglePinField(color: theme.orange)
                          else
                             SinglePinField(color: theme.grey),
                          const Spacer(),
                          if (pinLoginController.pin.isNotEmpty &&
                              pinLoginController.pin.length > 1)
                             SinglePinField(color: theme.orange)
                          else
                             SinglePinField(color: theme.grey),
                          const Spacer(),
                          if (pinLoginController.pin.isNotEmpty &&
                              pinLoginController.pin.length > 2)
                             SinglePinField(color: theme.orange)
                          else
                             SinglePinField(color: theme.grey),
                          const Spacer(),
                          if (pinLoginController.pin.isNotEmpty &&
                              pinLoginController.pin.length > 3)
                             SinglePinField(color: theme.orange)
                          else
                             SinglePinField(color: theme.grey),
                          const Spacer(),
                        ],
                      )
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Spacer(),
                          SingleButton(
                            number: "1",
                            onPress: () {
                              pinLoginController.onNumberClicked(1);
                            },
                          ),
                          const Spacer(),
                          SingleButton(
                            number: "2",
                            onPress: () {
                              pinLoginController.onNumberClicked(2);
                            },
                          ),
                          const Spacer(),
                          SingleButton(
                            number: "3",
                            onPress: () {
                              pinLoginController.onNumberClicked(3);
                            },
                          ),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Spacer(),
                          SingleButton(
                            number: "4",
                            onPress: () {
                              pinLoginController.onNumberClicked(4);
                            },
                          ),
                          const Spacer(),
                          SingleButton(
                            number: "5",
                            onPress: () {
                              pinLoginController.onNumberClicked(5);
                            },
                          ),
                          const Spacer(),
                          SingleButton(
                            number: "6",
                            onPress: () {
                              pinLoginController.onNumberClicked(6);
                            },
                          ),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Spacer(),
                          SingleButton(
                            number: "7",
                            onPress: () {
                              pinLoginController.onNumberClicked(7);
                            },
                          ),
                          const Spacer(),
                          SingleButton(
                            number: "8",
                            onPress: () {
                              pinLoginController.onNumberClicked(8);
                            },
                          ),
                          const Spacer(),
                          SingleButton(
                            number: "9",
                            onPress: () {
                              pinLoginController.onNumberClicked(9);
                            },
                          ),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Spacer(),
                          const SizedBox(width: 80,),
                          const Spacer(),
                          SingleButton(
                            number: "0",
                            onPress: () {
                              pinLoginController.onNumberClicked(0);
                            },
                          ),
                          const Spacer(),
                          MaterialButton(
                              focusElevation: 0,
                              hoverElevation: 0,
                              highlightElevation: 0,
                              shape: const CircleBorder(),
                              onPressed: (){
                                pinLoginController.onClearLast();
                              },
                              elevation: 0,
                              color: theme.background,
                              child: const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Icon(Icons.clear))
                          ),
                          const Spacer()
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: MaterialButton(
                          onPressed: () {
                            pinLoginController.confirmLoginPin();
                          },
                          minWidth: double.infinity,
                          height: 50,
                          color: theme.orange,
                          child: Text("Finish",
                              style: TextStyle(color: theme.white, fontSize: 18)),
                        ),
                      ),
                      const Spacer()
                    ],
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
