import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/pin_login/components/single_button.dart';
import 'package:haba_pay_main/screens/pin_login/components/single_pin_field.dart';
import 'package:haba_pay_main/screens/pin_login/controllers/pin_login_controller.dart';

class CreateLoginPin extends StatefulWidget {
  const CreateLoginPin({super.key});

  @override
  State<CreateLoginPin> createState() => _CreateLoginPinState();
}

class _CreateLoginPinState extends State<CreateLoginPin> {
  final pinLoginController = Get.put(PinLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          const Text(
            "Create a Login PIN",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(flex: 2,),
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
                pinLoginController.createLoginPin();
              },
              minWidth: double.infinity,
              height: 50,
              color: Colors.orange,
              child: const Text("Confirm PIN",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
