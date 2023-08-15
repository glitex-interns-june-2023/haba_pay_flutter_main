import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String title;
  final IconData? icon;
  final Function() onPress;

  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onPress,
    required this.icon
  });

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: widget.onPress,
        child: Row(
          children: [
            Icon(widget.icon),
            Text(widget.title)
          ],
        )
    );
  }
}
