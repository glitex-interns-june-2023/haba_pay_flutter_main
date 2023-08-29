import 'package:flutter/material.dart';

import '../../Theme/custom_theme.dart';

CustomTheme theme = CustomTheme();

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final Function () onClick;
  const CustomButton({super.key, required this.title, required this.onClick, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          onClick();
        },
        height: 50,
        minWidth: double.infinity,
        color: theme.orange,
        child: !isLoading ? Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.white,
              fontSize: 20),
        ) : CircularProgressIndicator(
          color: theme.white,
        )
    );
  }
}
