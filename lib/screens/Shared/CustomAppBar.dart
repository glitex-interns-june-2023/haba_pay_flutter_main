import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';
import 'package:get/get.dart';

final CustomTheme theme = CustomTheme();

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: theme.white,
      leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.black,
          )),
      title: Text(
        title,
        style: TextStyle(color: theme.black),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: (){},
            child: SvgPicture.asset(
              'assets/images/bell.svg'
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
