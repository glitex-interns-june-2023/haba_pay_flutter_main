import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/loading/controller/LoadingController.dart';
import 'package:get/get.dart';

final LoadingController loadingController = Get.put(LoadingController());
final CustomTheme theme = CustomTheme();
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: theme.orange,
        ),
      ),
    );
  }
}
