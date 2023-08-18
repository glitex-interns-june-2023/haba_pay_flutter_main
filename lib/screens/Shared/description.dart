import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String description;
  const Description({super.key, required this.description});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.description,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
