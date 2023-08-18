import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';

final CustomTheme theme = CustomTheme();
class SingleSettingsButton extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onClick;
  const SingleSettingsButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.background
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              icon,
              color: theme.black,
              height: 20,
            ),
          ),
        ),
        const SizedBox(width: 20,),
        Text(
            title,
          style: const TextStyle(
            fontSize: 18
          ),
        )
      ],
    );
  }
}
