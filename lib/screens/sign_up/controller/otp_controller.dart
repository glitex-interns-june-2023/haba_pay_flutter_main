import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:haba_pay_main/services/base_client.dart';

class OtpController extends GetxController {
  RxString rPhoneNumber = "".obs;

  /// Send OTP to specified phone number
  sendOTP(String phoneNumber) async {
    rPhoneNumber.value = phoneNumber;

    const String sendOtpURL = "/google/update-phone-number/";
    final String formattedPhoneNumber = formatPhoneNumber(phoneNumber);
    await BaseClient.post(sendOtpURL,
        {"phone_number": formattedPhoneNumber, "email": "test@habapay.com"});
  }

  /// confirm OTP code
  verifyOTP(String otp) async {
    const String verifyOptURL = "/google/verify-otp/";
    if (rPhoneNumber.isEmpty) {
      throw Exception(
          "Could not retrieve phone number. Please go back and try again");
    }

    final String formattedPhoneNumber = formatPhoneNumber(rPhoneNumber.value);

    await BaseClient.post(
        verifyOptURL, {"phone_number": formattedPhoneNumber, "otp": otp});
  }

  /// format number for sending otp
  String formatPhoneNumber(String phoneNumber) {
    // get the last nine digits of the phone number
    final String formattedPhoneNumber =
        "+254${phoneNumber.substring(phoneNumber.length - 9)}";
    return formattedPhoneNumber;
  }
}
