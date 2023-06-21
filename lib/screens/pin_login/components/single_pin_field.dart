import 'package:flutter/material.dart';

class SinglePinField extends StatelessWidget {
  final Color color;
  const SinglePinField({
    super.key,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 50,
      onPressed: null,
      disabledColor: color,
      disabledElevation: 0,
      shape: const CircleBorder(),
    );
  }
}
