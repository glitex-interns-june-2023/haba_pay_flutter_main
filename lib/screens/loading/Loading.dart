import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:haba_pay_main/screens/loading/loading_controller.dart';

final CustomTheme theme = CustomTheme();
final LoadingController loadingController = LoadingController();
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: theme.orange,
      ),
    );
  }
}
