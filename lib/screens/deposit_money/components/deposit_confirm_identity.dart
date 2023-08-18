import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_confirm_payment.dart';

import '../../Shared/confirm_identity.dart';
import 'package:get/get.dart';

class DepositConfirmIdentity extends StatelessWidget {
  const DepositConfirmIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(
      onConfirm: (){
        Get.to(()=> const DepositConfirmPayment(),
            transition: Transition.rightToLeft,
        );
      },
    );
  }
}
