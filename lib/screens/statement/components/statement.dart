import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/statement/components/CustomOutlinedButton.dart';

class Statement extends StatelessWidget {
  const Statement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomOutlinedButton(title: "All", onPress: (){}, icon: null),
              CustomOutlinedButton(title: "Sent", onPress: (){}, icon: Icons.send),
              CustomOutlinedButton(title: "Withdraw", onPress: (){}, icon: Icons.receipt),
              CustomOutlinedButton(title: "Deposit", onPress: (){}, icon: Icons.abc)
            ],
          )
        ],
      ),
    );
  }
}

