import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/confirm_identity.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/screens/send_money/controller/send_money_controller.dart';

final SendMoneyController sendMoneyController = Get.put(SendMoneyController());
class SendMoneyConfirmIdentity extends StatelessWidget {
  const SendMoneyConfirmIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(onConfirm: (){
      sendMoneyController.onConfirmIdentityClicked();
    });
  }
}

