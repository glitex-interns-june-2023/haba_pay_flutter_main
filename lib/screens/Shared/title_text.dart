import 'package:flutter/material.dart';

class TitleText extends StatefulWidget {
  final String title;
  const TitleText({super.key, required this.title});

  @override
  State<TitleText> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
