import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/confirm_identity.dart';

class SendMoneyConfirmIdentity extends StatefulWidget {
  const SendMoneyConfirmIdentity({super.key});

  @override
  State<SendMoneyConfirmIdentity> createState() => _SendMoneyConfirmIdentityState();
}

class _SendMoneyConfirmIdentityState extends State<SendMoneyConfirmIdentity> {
  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(onConfirm: (){});
  }
}

