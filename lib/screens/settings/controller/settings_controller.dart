import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/screens/sign_up/components/sign_up.dart';
import '../../../services/base_client.dart';
import '../../../services/pin_secure_storage.dart';
import '../../dashboard/components/dashboard.dart';
import '../components/pin_updated.dart';
import '../components/verification_successful_phone_settings.dart';
import '../components/verify_phone_number_settings.dart';

class SettingsController extends GetxController {
  final SecureStorage _secureStorage = SecureStorage();
  var obscurePin = [true, true, true].obs;
  var userNameInitials = "".obs;
  var userName = "".obs;
  var userEmail = "".obs;
  var userNumber = "".obs;
  var userLocation = "".obs;

  var isQuickLoginChecked = false.obs;
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

  @override
  Future<void> onInit() async {
    super.onInit();
    userNameInitials.value = await _secureStorage.getInitials() ?? "";
    userEmail.value = await _secureStorage.getEmail() ?? "";
    userNumber.value = await _secureStorage.getPhoneNumber() ?? "";
    userName.value = await _secureStorage.getUserName() ?? "";
    userLocation.value = await _secureStorage.getLocation() ?? "";

    var quickLogin = await _secureStorage.getQuickLogin();
    isQuickLoginChecked.value = quickLogin == "true" ? true : false;

  }

  onObscurePin(int index) {
    obscurePin[index] = !obscurePin[index];
  }

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

  onQuickLoginChanged(bool isSwitched) async {
    var pin = await _secureStorage.getPin();
    if(pin!.isEmpty){
      Get.showSnackbar(
        const GetSnackBar(
          isDismissible: true,
          message: 'Set a pin first',
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      isQuickLoginChecked.value = isSwitched;
      await _secureStorage.setQuickLogin("${isQuickLoginChecked.value}");
    }
  }

  onUpdatePinClicked() async {
    if (currentPinController.text.isEmpty) {
      currentPinError.value = "Enter a valid value";
    } else if (currentPinController.text.length < 4) {
      currentPinError.value = "Enter 4 numbers";
    } else if (newPinController.text.isEmpty) {
      newPinError.value = "Enter a valid value";
    } else if (newPinController.text.length < 4) {
      newPinError.value = "Enter 4 number";
    } else if (confirmPinController.text.isEmpty) {
      confirmPinError.value = "Enter a valid value";
    } else if (confirmPinController.text.length < 4) {
      confirmPinError.value = "Enter 4 numbers";
    } else {
      var currentPin = await _secureStorage.getPin();
      currentPin = currentPin
          ?.replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll(',', '')
          .removeAllWhitespace;
      if (currentPinController.text != currentPin) {
        currentPinError.value = "Wrong pin";
      } else if (newPinController.text != confirmPinController.text) {
        confirmPinError.value = "Pin does not match";
      } else {
        await _secureStorage.setPin(confirmPinController.text);
        Get.to(() => const PinUpdated(), transition: Transition.rightToLeft);
      }
    }
  }

  logout() async {
    isLoading(true);
    try {
      await _secureStorage.setAuthToken("");
      googleAccount.value = await _googleSignIn.signOut();
      Get.offAll(() => const SignUp(), transition: Transition.rightToLeft);
    } finally {
      isLoading(false);
    }
  }

  sendEmail() async {
    isSendingEmail(true);
    try {
      var data = {
        'email': userEmail.value,
      };
      var response = await BaseClient.post(emailVerificationUrl, data);

      var success = json.decode(response);

      if (success['success'] == true) {
        isEmailSend(true);
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown error occurred",
          duration: Duration(seconds: 3),
        ));
      }
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

  goToHome(){
    Get.offAll(() => const Dashboard());
  }
}
