import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/routes/app_page.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getPinLogin(),
    getPages: AppPage.routes,
  ));
}
