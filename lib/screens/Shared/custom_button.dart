import 'package:flutter/material.dart';

import '../../Theme/custom_theme.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function () onClick;
  const CustomButton({super.key, required this.title, required this.onClick});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  CustomTheme theme = CustomTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          widget.onClick();
        },
        height: 50,
        minWidth: double.infinity,
        color: theme.orange,
        child: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.white,
              fontSize: 20),
        )
    );
  }
}
