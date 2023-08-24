import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/loading/loading_controller.dart';

final CustomTheme theme = CustomTheme();
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final LoadingController loadingController = LoadingController();
    loadingController.onInit();
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: theme.orange,
        ),
      ),
    );
  }
}
