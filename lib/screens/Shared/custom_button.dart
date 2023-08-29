import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Theme/custom_theme.dart';

CustomTheme theme = CustomTheme();

class CustomButton extends StatelessWidget {
  final bool isSvgVector;
  final String? svgVector;
  final bool isLoading;
  final String title;
  final Function() onClick;
  const CustomButton(
      {super.key,
      required this.title,
      required this.onClick,
      this.isLoading = false,
      this.isSvgVector = false,
      this.svgVector});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
          onClick();
        },
        height: 50,
        minWidth: double.infinity,
        color: theme.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isSvgVector == true && isLoading == false)
              SvgPicture.asset(svgVector!)
            else
              const SizedBox(width: 0,),
            const SizedBox(width: 10,),
            if (isLoading == true)
              CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.white,
              )
            else
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.white,
                    fontSize: 20),
              )
          ],
        ));
  }
}
