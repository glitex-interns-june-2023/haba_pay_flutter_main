import 'package:flutter/material.dart';

class SingleButton extends StatelessWidget {
  final String number;
  final Function() onPress;
  const SingleButton({
    super.key,
    required this.number,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPress,
      color: Colors.amber,
      shape: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
            number,
          style: const TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
