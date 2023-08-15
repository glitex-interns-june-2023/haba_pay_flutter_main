import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/statement/controller/statement_controller.dart';

import '../../sign_in/controller/sign_in_screen_controller.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String title;
  final IconData? icon;
  final Function() onPress;

  const CustomOutlinedButton(
      {super.key,
      required this.title,
      required this.onPress,
      required this.icon});

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  final StatementController statementController = Get.put(StatementController());
  //final signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => OutlinedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              statementController.isAllPressed == true.obs
                ? Colors.orange : Colors.transparent
            )
        ),
        onPressed: widget.onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Icon(widget.icon), Text(widget.title)],
        )),
    );
  }
}
