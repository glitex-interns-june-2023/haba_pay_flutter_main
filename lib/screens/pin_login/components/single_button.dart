import 'package:flutter/material.dart';

class SingleButton extends StatelessWidget {
  final String number;
  final Color? color;
  final Function() onPress;
  const SingleButton({
    super.key,
    required this.number,
    required this.onPress,
    this.color = Colors.brown
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPress,
      elevation: 0,
      color: color,
      shape: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
