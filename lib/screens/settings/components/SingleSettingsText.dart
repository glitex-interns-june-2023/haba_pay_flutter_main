import 'package:flutter/material.dart';

class SingleSettingsText extends StatelessWidget {
  final String title;
  final String description;
  SingleSettingsText({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 18
          ),
        ),
      ],
    );
  }
}
