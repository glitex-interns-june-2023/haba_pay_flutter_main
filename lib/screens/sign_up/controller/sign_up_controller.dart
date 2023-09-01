import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/model/GoogleTokenModel.dart';
import 'package:haba_pay_main/screens/sign_up/components/add_phone_number.dart';
import 'package:haba_pay_main/services/base_client.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';
import '../components/verification_successful.dart';
import '../components/verify_phone_number.dart';

class SignUpController extends GetxController {
  var phoneNumberError = "".obs;
  var codeError = "".obs;
  var phoneNumberController = TextEditingController();
  var codeController = TextEditingController();
  final SecureStorage _secureStorage = SecureStorage();
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn(
    clientId:
        "136354562599-ote548dd9lm4r34i8vjval0ifvfbhb77.apps.googleusercontent.com",
    scopes: [
      'https://www.googleapis.com/auth/userinfo.email',
      'openid',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  onVerifyClicked() async {
    if (codeController.text.isEmpty) {
      codeError.value = "Enter a valid code";
    } else {
      isLoading(true);
      try {
        var data = {
          'phone_number':phoneNumberController.text,
          'otp': codeController.text
        };
        var response = await BaseClient.post(
                "/v1/auth/verify-otp",
            json.encode(data))
            .catchError((onError) {
          Get.showSnackbar(const GetSnackBar(
            message: "Unknown error occurred",
            duration: Duration(seconds: 3),
          ));
        });

        var success = json.decode(response);

        if (success['success'] == true) {
          Get.to(
            () => const VerificationSuccessful(),
            transition: Transition.rightToLeft,
          );
        } else {
          Get.showSnackbar(const GetSnackBar(
            message: "Unknown error occurred",
            duration: Duration(seconds: 3),
          ));
        }
      } finally {
        isLoading(false);
      }
    }
  }

  onAddClicked() async {
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError.value = "Enter a valid number";
    } else if (phoneNumberController.text.length < 10) {
      phoneNumberError.value = "Phone should be at least 10 digits";
    } else {
      isLoading(true);
      try {
        await _secureStorage.setPhoneNumber(phoneNumberController.text);
        var data = {
          'phone_number':phoneNumberController.text,
          'email': await _secureStorage.getEmail()
        };
        var response = await BaseClient.post(
                "/v1/auth/send-otp",
                json.encode(data))
            .catchError((onError) {
          Get.showSnackbar(const GetSnackBar(
            message: "Unknown error occurred",
            duration: Duration(seconds: 10),
          ));
        });

        var success = json.decode(response);

        if (success['success'] == true) {
          Get.to(
            () => const VerifyPhoneNumber(),
            transition: Transition.rightToLeft,
          );
        } else {
          Get.showSnackbar(const GetSnackBar(
            message: "Unknown error occurred",
            duration: Duration(seconds: 3),
          ));
        }
      } finally {
        isLoading(false);
      }
    }
  }

  signUp() async {
    isLoading(true);
    try {
      googleAccount.value = await _googleSignIn.signIn();
      var credential =
          await _googleSignIn.currentUser!.authentication.catchError((onError) {
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown error occurred",
          duration: Duration(seconds: 3),
        ));
      });
      var response = await BaseClient.post(
              "/v1/auth/google", GoogleTokenModel(token: credential.idToken))
          .catchError((onError) {
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown error",
          duration: Duration(seconds: 3),
        ));
      });

      var user = json.decode(response);

      if (response != null) {
        if (user['success'] != false) {
          await _secureStorage.setEmail(user['data']['email'] ?? "");
          await _secureStorage.setUserName(user['data']['username'] ?? "");
          await _secureStorage.setFirstName(user['data']['first_name'] ?? "");
          await _secureStorage.setLastName(user['data']['last_name'] ?? "");
          await _secureStorage.setAuthToken(user['data']['access_token'] ?? "");
          await _secureStorage.setRefreshToken(user['data']['refresh_token'] ?? "");
          Get.to(() => const AddPhoneNumber(),
              transition: Transition.rightToLeft);
        } else {
          Get.showSnackbar(GetSnackBar(
            message: user.message,
            duration: const Duration(seconds: 3),
          ));
        }
      } else {
        Get.showSnackbar(GetSnackBar(
          message: user.message,
          duration: const Duration(seconds: 3),
        ));
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.clear();
    codeController.clear();
  }
}
