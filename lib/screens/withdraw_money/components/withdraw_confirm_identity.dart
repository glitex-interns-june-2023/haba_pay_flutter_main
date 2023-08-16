import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/confirm_identity.dart';

class WithdrawConfirmIdentity extends StatefulWidget {
  const WithdrawConfirmIdentity({super.key});

  @override
  State<WithdrawConfirmIdentity> createState() => _WithdrawConfirmIdentityState();
}

class _WithdrawConfirmIdentityState extends State<WithdrawConfirmIdentity> {
  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(
        onConfirm: (){}
    );
  }
}
