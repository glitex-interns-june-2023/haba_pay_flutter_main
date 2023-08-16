import 'package:flutter/material.dart';

import '../../Shared/confirm_identity.dart';

class DepositConfirmIdentity extends StatefulWidget {
  const DepositConfirmIdentity({super.key});

  @override
  State<DepositConfirmIdentity> createState() => _DepositConfirmIdentityState();
}

class _DepositConfirmIdentityState extends State<DepositConfirmIdentity> {
  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(
      onConfirm: (){},
    );
  }
}
