import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/deposit_money/controller/deposit_money_controller.dart';
import '../../Shared/confirm_identity.dart';
import 'package:get/get.dart';

final DepositMoneyController depositMoneyController =
    Get.put(DepositMoneyController());

class DepositConfirmIdentity extends StatelessWidget {
  const DepositConfirmIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(
      isLoading: depositMoneyController.isLoading,
      onConfirm: () {
        depositMoneyController.confirmIdentity();
      },
    );
  }
}
