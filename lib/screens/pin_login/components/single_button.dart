import 'package:flutter/material.dart';

class SingleButton extends StatefulWidget {
  final String number;
  final Color? color;
  final Function() onPress;
  const SingleButton({
    super.key,
    required this.number,
    required this.onPress,
    this.color = Colors.brown,
  });

  @override
  State<SingleButton> createState() => _SingleButtonState();
}

class _SingleButtonState extends State<SingleButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: widget.onPress,
      elevation: 0,
      color: widget.color,
      shape: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          widget.number,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
