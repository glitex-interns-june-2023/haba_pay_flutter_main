import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/routes/app_page.dart';
import 'package:haba_pay_main/screens/pin_login/components/pin_login.dart';
import 'package:haba_pay_main/screens/sign_up/components/sign_up.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

final SecureStorage _secureStorage = SecureStorage();

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
        future: _secureStorage.getQuickLogin(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: theme.orange,
              ),
            );
          } else if( snapshot.hasData && snapshot.data == "true"){
            return const PinLogin();
          } else {
            return const SignUp();
          }
        },
      ),
      getPages: AppPage.routes,
    ),
  );
}
