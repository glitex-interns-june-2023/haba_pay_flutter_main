import 'package:flutter/material.dart';
import 'package:haba_pay_main/screens/Shared/confirm_identity.dart';
import 'package:haba_pay_main/screens/statement_download/components/statement_preparing_download.dart';
import 'package:get/get.dart';

class StatementDownloadConfirmIdentity extends StatelessWidget {
  const StatementDownloadConfirmIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmIdentity(
        onConfirm: (){
          statementDownloadController.onConfirmIdentityClicked();
        }
    );
  }
}
