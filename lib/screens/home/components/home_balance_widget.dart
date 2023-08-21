import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';

final CustomTheme theme = CustomTheme();

class HomeBalanceWidget extends StatelessWidget {
  final String balance;
  final bool isVisibilityOn;
  final Function() onVisibilityChanged;

  const HomeBalanceWidget(
      {super.key,
      required this.balance,
      required this.isVisibilityOn,
      required this.onVisibilityChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Blur(
            blurColor: theme.linear,
            blur: isVisibilityOn ? 0 : 5,
            child: Text(
              balance,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: theme.white),
            )),
        const Spacer(),
        IconButton(
          onPressed: () {
            onVisibilityChanged();
          },
          icon: Icon(
            isVisibilityOn ? Icons.visibility : Icons.visibility_off,
            color: theme.white,
          ),
        )
      ],
    );
  }
}
