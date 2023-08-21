import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/confirm_identity.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/send_money/components/verifying_transaction.dart';

class SendMoneyConfirmIdentity extends StatelessWidget {
  const SendMoneyConfirmIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(onConfirm: (){
      Get.to(()=> const VerifyingTransaction(), transition: Transition.rightToLeft,);
    });
  }
}

