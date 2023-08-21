import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';

final CustomTheme theme = CustomTheme();

class Balance extends StatelessWidget {
  final String balance;
  final bool isVisibilityOn;
  final Function() onVisibilityChanged;
  const Balance(
      {super.key,
      required this.balance,
      required this.isVisibilityOn,
      required this.onVisibilityChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Balance",
                style: TextStyle(color: theme.grey, fontSize: 18),
              )),
        ),
        Row(
          children: [
            Blur(
              blur: isVisibilityOn ? 0 : 5,
              child: Text(
                balance,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                onVisibilityChanged();
              },
              icon: Icon(
                isVisibilityOn ? Icons.visibility : Icons.visibility_off,
              ),
            )
          ],
        ),
      ],
    );
  }
}
