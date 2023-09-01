import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/Shared/CustomAppBar.dart';
import 'package:haba_pay_main/screens/Shared/SharedPinController.dart';
import 'package:haba_pay_main/screens/Shared/custom_button.dart';
import '../pin_login/components/single_button.dart';
import '../pin_login/components/single_pin_field.dart';

final CustomTheme theme = CustomTheme();

final pinLoginController = Get.put(SharedPinController());

class ConfirmIdentity extends StatelessWidget {
  final bool isLoading;
  final Function() onConfirm;
  const ConfirmIdentity({
    super.key,
    this.isLoading = false,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: const CustomAppBar(title: "Confirm identity"),
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
                          const Spacer(
                            flex: 2,
                          ),
                          const Text(
                            "Confirm identity",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
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
                              )),
                          const Spacer(
                            flex: 2,
                          ),
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
                          const Spacer(),
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
                          const Spacer(),
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
                          const Spacer(),
                          Row(
                            children: [
                              const Spacer(),
                              const SizedBox(
                                width: 80,
                              ),
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
                                  onPressed: () {
                                    pinLoginController.onClearLast();
                                  },
                                  elevation: 0,
                                  color: theme.background,
                                  child: const Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Icon(Icons.clear))),
                              const Spacer()
                            ],
                          ),
                          const Spacer(),
                          const SizedBox(height: 20,),
                          CustomButton(
                              isLoading: isLoading,
                              title: "Confirm", onClick: (){
                            pinLoginController.confirmLoginPin(
                                (){ onConfirm(); }
                            );
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
