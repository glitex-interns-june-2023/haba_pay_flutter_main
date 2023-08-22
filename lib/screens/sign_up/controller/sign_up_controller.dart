import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/model/User.dart';
import 'package:haba_pay_main/model/sign_in_entity.dart';
import 'package:haba_pay_main/routes/app_page.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

import '../components/add_phone_number.dart';
import '../components/verification_successful.dart';
import '../components/verify_phone_number.dart';

class SignUpController extends GetxController {
  var phoneNumberError = "".obs;
  var codeError = "".obs;
  var phoneNumberController = TextEditingController();
  var codeController = TextEditingController();
  var userInfo = User().obs;
  var user = SignInEntity().obs;
  final SecureStorage _secureStorage = SecureStorage();
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  onVerifyClicked(){
    if(codeController.text.isEmpty){
      codeError.value = "Enter a valid code";
    } else {
      Get.to(
            () => const VerificationSuccessful(),
        transition: Transition.rightToLeft,
      );
    }
  }

  onAddClicked() async{
    if(phoneNumberController.text.isEmpty){
      phoneNumberError.value = "Enter a valid number";
    } else if(phoneNumberController.text.length < 10) {
      phoneNumberError.value = "Phone should be at least 10 digits";
    } else {
      Get.to(
            () => const VerifyPhoneNumber(),
        transition: Transition.rightToLeft,
      );
    }
  }
  signUp() async {
    // mydebug - Move to next screen for testing purposes
    Get.toNamed(AppPage.getAddPhoneNumber());
    return;
    isLoading(true);
    try {
      googleAccount.value = await _googleSignIn.signIn();
      if (googleAccount.value == null) {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Unknown error occurred',
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        await _secureStorage.setClientId(googleAccount.value?.id ?? "no id");
        await _secureStorage
            .setUserName(googleAccount.value?.displayName ?? "no name");
        await _secureStorage.setEmail(googleAccount.value?.email ?? "no email");
        Get.to(() => const AddPhoneNumber(),
            transition: Transition.rightToLeft);
      }
    } finally {
      isLoading(false);
    }
  }

  // sendUserInfo() async{
  //   isLoading(true);
  //   try{
  //     userInfo(
  //      User(
  //        username: await _secureStorage.getUserName(),
  //        clientId: await _secureStorage.getClientId(),
  //        email: await _secureStorage.getEmail(),
  //        phoneNumber: await _secureStorage.getPhoneNumber()
  //      )
  //     );
  //     // var response = await BaseClient.post(
  //     //     "/sign_up",
  //     //     userInfo
  //     // );
  //     // user(SignInEntity.fromJson(response));
  //     await _secureStorage.setAuthToken(user.value.accessToken);
  //     Get.to(()=> const Dashboard(), transition: Transition.rightToLeft);
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
