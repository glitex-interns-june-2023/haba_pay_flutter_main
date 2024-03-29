import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://habaapi.glitexsolutions.co.ke/api";
const String googleAuthUrl = "/v1/auth/google";
const String sendOtpUrl = "/v1/verifications/otp/send";
const String verifyOtpUrl = "/v1/verifications/otp/verify";
const String emailVerificationUrl = "/v1/verifications/email/send";
const String walletBalanceUrl = "/v1/wallet/balance?phone=";
const String confirmRecipientDetailsUrl = "/v1/wallet/confirm-details?phone=";
const String sendMoneyUrl = "/v1/wallet/send-money";
const String withdrawCashUrl = "/v1/wallet/withdraw";
const String depositCashUrl = "/v1/wallet/deposit";
const String listUserTransactionsUrl = "/v1/users/";
const String updateBusinessDetailsUrl = "/v1/users/";

final SecureStorage _secureStorage = SecureStorage();

class BaseClient {
  static var client = http.Client();
  static Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'Bearer ${await _secureStorage.getAuthToken()}',
    };

    try {
      var response = await client.get(url, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        //throw exception
        var result = json.decode(response.body);
        Get.showSnackbar(GetSnackBar(
            message: result['message'], duration: const Duration(seconds: 3)));
      }
    } on SocketException catch (e) {
      Get.showSnackbar(const GetSnackBar(
          message: "No internet connection", duration: Duration(seconds: 3)));
    }
  }

  static Future<dynamic> post(String api, dynamic object) async {
    var payload = json.encode(object);
    var url = Uri.parse(baseUrl + api);
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await client.post(url, headers: headers, body: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        //throw exception
        var result = json.decode(response.body);
        Get.showSnackbar(GetSnackBar(
            message: result['message'], duration: const Duration(seconds: 3)));
      }
    } on SocketException catch (e) {
      Get.showSnackbar(const GetSnackBar(
          message: "No internet connection", duration: Duration(seconds: 3)));
    }
  }

  static Future<dynamic> put(String api, dynamic object) async {
    var payload = json.encode(object);
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'Bearer token',
      'Content-Type': 'application/json'
    };

    try {
      var response = await client.put(url, headers: headers, body: payload);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        //throw exception
        var result = json.decode(response.body);
        Get.showSnackbar(GetSnackBar(
            message: result['message'], duration: const Duration(seconds: 3)));
      }
    } on SocketException catch (e) {
      Get.showSnackbar(const GetSnackBar(
          message: "No internet connection", duration: Duration(seconds: 3)));
    }
  }

  static Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorization': 'Bearer token',
    };

    var response = await client.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception
    }
  }
}

// my http overrides
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
