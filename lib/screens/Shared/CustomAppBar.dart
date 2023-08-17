import 'package:flutter/material.dart';
import 'package:haba_pay_main/Theme/custom_theme.dart';

final CustomTheme theme = CustomTheme();

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function() onIconClicked;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onIconClicked,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: theme.white,
      leading: IconButton(
          onPressed: onIconClicked(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.black,
          )),
      title: Text(
        title,
        style: TextStyle(color: theme.black),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: theme.black,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
