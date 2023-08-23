import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/confirm_identity.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/withdraw_money/controller/WithdrawMoneyController.dart';

final WithdrawMoneyController withdrawMoneyController =
    Get.put(WithdrawMoneyController());

class WithdrawConfirmIdentity extends StatelessWidget {
  const WithdrawConfirmIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(onConfirm: () {
      withdrawMoneyController.onConfirmIdentityClicked();
    });
  }
}
