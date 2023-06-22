import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Use this class to initialize and load env variables that will be used in this app.
/// Env loaded in the main app
class EnvVars {
  static final EnvVars _instance = EnvVars._internal();

  String? twilioAccountSid, twilioAuthToken, twilioOTPServiceId;

  factory EnvVars() {
    return _instance;
  }

// initialize your variables with api key values.
  EnvVars._internal() {
    twilioAccountSid = dotenv.env["TWILIO_ACCOUNT_SID"];
    twilioAuthToken = dotenv.env["TWILIO_AUTH_TOKEN"];
    twilioOTPServiceId = dotenv.env["TWILIO_OTP_SERVICE_ID"];
  }
}
