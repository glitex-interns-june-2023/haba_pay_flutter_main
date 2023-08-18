import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/confirm_identity.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/withdraw_money/components/withdraw_verifying_transaction.dart';

class WithdrawConfirmIdentity extends StatelessWidget {
  const WithdrawConfirmIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(
        onConfirm: (){
          Get.to(()=> const WithdrawVerifyingTransaction(),
              transition: Transition.rightToLeft,
          );
        }
    );
  }
}
