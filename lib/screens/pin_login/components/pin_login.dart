import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/pin_login/components/single_button.dart';
import 'package:haba_pay_main/screens/pin_login/components/single_pin_field.dart';
import 'package:haba_pay_main/screens/pin_login/controllers/pin_login_controller.dart';

class PinLogin extends StatefulWidget {
  const PinLogin({super.key});

  @override
  State<PinLogin> createState() => _PinLoginState();
}

class _PinLoginState extends State<PinLogin> {
  final pinLoginController = Get.put(PinLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          const Text(
            "Good afternoon, Brian",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
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
              )),
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
              const Spacer(
                flex: 3,
              ),
              SingleButton(
                number: "0",
                onPress: () {
                  pinLoginController.onNumberClicked(0);
                },
              ),
              const Spacer(),
              SingleButton(
                number: "del",
                onPress: () {
                  pinLoginController.onClearLast();
                },
              ),
              const Spacer()
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: MaterialButton(
              onPressed: () {},
              minWidth: double.infinity,
              height: 50,
              color: Colors.orange,
              child: const Text("Log in",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
