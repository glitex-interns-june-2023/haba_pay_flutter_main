import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/routes/app_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.getDepositConfirmIdentity(),
      getPages: AppPage.routes,
    ),
  );
}
