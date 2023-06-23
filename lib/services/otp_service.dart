import "package:haba_pay_main/config/config.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class OTP {
  static final otpUrl =
      "https://verify.twilio.com/v2/Services/${EnvVars().twilioOTPServiceId}/Verifications";
  static final verificationURL =
      "https://verify.twilio.com/v2/Services/${EnvVars().twilioOTPServiceId}/VerificationCheck";
  static final accountSid = EnvVars().twilioAccountSid;
  static final authToken = EnvVars().twilioAuthToken;

  /// Sends an OTP and returns the verificationSid token that will be used to verify OTP
  static Future<String> sendOTP(String phoneNumber) async {
    final client = http.Client();
    final String formattedPhoneNumber =
        "+254${phoneNumber.substring(phoneNumber.length - 9)}";

    try {
      final response = await client.post(Uri.parse(otpUrl), headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization":
            "Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}"
      }, body: {
        "To": formattedPhoneNumber,
        "Channel": "sms",
      });

      if (response.statusCode == 201) {
        final jsonResponse = await jsonDecode(response.body);
        final verificationSid = jsonResponse['sid'];
        return verificationSid;
      } else {
        return "";
      }
    } finally {
      client.close();
    }
  }

  /// returns true|false when verification succeeds|fails repectively
  static Future<bool> verifyOTP(
      String verificationSid, String phoneNumber, String otp) async {
    final client = http.Client();
    final formatedPhoneNumber =
        "+254${phoneNumber.substring(phoneNumber.length - 9)}";

    try {
      final response = await client.post(Uri.parse(verificationURL), headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$accountSid:$authToken'))}'
      }, body: {
        "To": formatedPhoneNumber,
        "Code": otp,
        "ServiceSid": verificationSid
      });

      if (response.statusCode == 200) {
        final jsonResponse = await jsonDecode(response.body);
        final status = jsonResponse['status'];

        if (status == 'approved') {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } finally {
      client.close();
    }
  }
}
