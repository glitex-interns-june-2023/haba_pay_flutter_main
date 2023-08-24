import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';

final CustomTheme theme = CustomTheme();
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => CircularProgressIndicator(
        color: theme.orange,
      )),
    );
  }
}
