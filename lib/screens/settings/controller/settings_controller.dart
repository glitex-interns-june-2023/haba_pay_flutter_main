import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/screens/sign_up/components/sign_up.dart';

import '../components/pin_updated.dart';
import '../components/verification_successful_phone_settings.dart';
import '../components/verify_phone_number_settings.dart';

class SettingsController extends GetxController {
  var codeError = "".obs;
  var phoneNumberError = "".obs;
  var currentPinError = "".obs;
  var newPinError = "".obs;
  var confirmPinError = "".obs;
  var codeController = TextEditingController();
  var currentPinController = TextEditingController();
  var newPinController = TextEditingController();
  var confirmPinController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var phoneNumber = "".obs;
  var isMoreExpanded = false.obs;
  var isSendingEmail = false.obs;
  var isEmailSend = false.obs;
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  onAddPhoneNumberClicked() {
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError.value = "Enter a valid value";
    } else {
      Get.to(() => const VerifyPhoneNumberSettings(),
          transition: Transition.rightToLeft);
    }
  }

  onVerifyCodeClicked() {
    if (codeController.text.isEmpty) {
      codeError.value = "Enter a valid value";
    } else {
      Get.to(() => const VerificationSuccessfulPhoneSettings(),
          transition: Transition.rightToLeft);
    }
  }

  onUpdatePinClicked() {
    if (currentPinController.text.isEmpty) {
      currentPinError.value = "Enter a valid value";
    } else if (newPinController.text.isEmpty) {
      newPinError.value = "Enter a valid value";
    } else if (confirmPinController.text.isEmpty) {
      confirmPinError.value = "Enter a valid value";
    } else {
      Get.to(() => const PinUpdated(), transition: Transition.rightToLeft);
    }
  }

  logout() async {
    isLoading(true);
    try {
      googleAccount.value = await _googleSignIn.signOut();
      Get.offAll(() => const SignUp(), transition: Transition.rightToLeft);
    } finally {
      isLoading(false);
    }
  }

  sendEmail() {
    isSendingEmail(true);
    try {
      isEmailSend(true);
    } finally {
      isSendingEmail(false);
    }
  }

  onIsMoreExpanded() {
    isMoreExpanded.value = !isMoreExpanded.value;
  }

  verifyNumber(String number) {
    phoneNumber.value = number;
  }
}
