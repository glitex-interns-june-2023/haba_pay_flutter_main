import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../pin_login/components/single_button.dart';
import '../pin_login/components/single_pin_field.dart';
import '../pin_login/controllers/pin_login_controller.dart';

class ConfirmIdentity extends StatefulWidget {
  final Function() onConfirm;
  const ConfirmIdentity({
    super.key,
    required this.onConfirm,
  });

  @override
  State<ConfirmIdentity> createState() => _ConfirmIdentityState();
}

class _ConfirmIdentityState extends State<ConfirmIdentity> {
  final pinLoginController = Get.put(PinLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint){
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 2,
                        ),
                        const Text(
                          "Confirm identity",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20,),
                        Obx(() => Row(
                          children: [
                            const Spacer(),
                            if (pinLoginController.pin.isNotEmpty)
                              const SinglePinField(color: Colors.orange)
                            else
                              const SinglePinField(color: Colors.grey),
                            const Spacer(),
                            if (pinLoginController.pin.isNotEmpty &&
                                pinLoginController.pin.length > 1)
                              const SinglePinField(color: Colors.orange)
                            else
                              const SinglePinField(color: Colors.grey),
                            const Spacer(),
                            if (pinLoginController.pin.isNotEmpty &&
                                pinLoginController.pin.length > 2)
                              const SinglePinField(color: Colors.orange)
                            else
                              const SinglePinField(color: Colors.grey),
                            const Spacer(),
                            if (pinLoginController.pin.isNotEmpty &&
                                pinLoginController.pin.length > 3)
                              const SinglePinField(color: Colors.orange)
                            else
                              const SinglePinField(color: Colors.grey),
                            const Spacer(),
                          ],
                        )
                        ),
                        const Spacer(flex: 2,),
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
                                color: const Color(0xFFfff7e8),
                                child: const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Icon(Icons.clear))
                            ),
                            const Spacer()
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: MaterialButton(
                            onPressed: () {
                              pinLoginController.confirmLoginPin();
                              widget.onConfirm();
                            },
                            minWidth: double.infinity,
                            height: 50,
                            color: Colors.orange,
                            child: const Text("Confirm",
                                style: TextStyle(color: Colors.white, fontSize: 16)),
                          ),
                        ),
                        const Spacer()
                      ],
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
