import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';
import '../../../services/base_client.dart';


class SignInController extends GetxController{
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

  login() async {
    isLoading(true);
    try {
      googleAccount.value = await _googleSignIn.signIn();
      var credential = await _googleSignIn.currentUser!.authentication.catchError((onError){
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown error occurred",
          duration: Duration(seconds: 3),
        ));
      });

      var data = {
        'token': credential.idToken
      };
      var response = await BaseClient.post(googleAuthUrl,data)
          .catchError((onError) {
        Get.showSnackbar(GetSnackBar(
          message: onError.toString(),
          duration: const Duration(seconds: 3),
        ));
      });

      var user = json.decode(response);

      if (response != null) {
        if (user['success'] != false) {
          await _secureStorage.setUserId(user['data']['id'].toString() ?? "");
          await _secureStorage.setEmail(user['data']['email'] ?? "");
          await _secureStorage.setUserName(user['data']['username'] ?? "");
          await _secureStorage.setFirstName(user['data']['first_name'] ?? "");
          await _secureStorage.setLastName(user['data']['last_name'] ?? "");
          await _secureStorage.setAuthToken(user['data']['access_token'] ?? "");
          await _secureStorage.setRefreshToken(user['data']['refresh_token'] ?? "");
          Get.offAll(
                () => const Dashboard(),
            transition: Transition.rightToLeft,
          );
        } else {
          Get.showSnackbar(GetSnackBar(
            message: user['message'],
            duration: const Duration(seconds: 3),
          ));
        }
      } else {
        Get.showSnackbar(GetSnackBar(
          message: user['message'],
          duration: const Duration(seconds: 3),
        ));
      }
    } finally {
      isLoading(false);
    }
  }
}