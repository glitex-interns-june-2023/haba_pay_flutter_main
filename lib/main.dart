import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/routes/app_page.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.loading,
      getPages: AppPage.routes,
    ),
  );
}
