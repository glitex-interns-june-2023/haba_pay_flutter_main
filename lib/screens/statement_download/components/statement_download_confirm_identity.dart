import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/confirm_identity.dart';

class StatementDownloadConfirmIdentity extends StatefulWidget {
  const StatementDownloadConfirmIdentity({super.key});

  @override
  State<StatementDownloadConfirmIdentity> createState() => _StatementDownloadConfirmIdentityState();
}

class _StatementDownloadConfirmIdentityState extends State<StatementDownloadConfirmIdentity> {
  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(
        onConfirm: (){}
    );
  }
}
