import 'package:get/get.dart';
import 'package:haba_pay_main/screens/pin_login/components/pin_login.dart';
import '../screens/dashboard/components/dashboard.dart';
import '../screens/home/components/home.dart';
import '../screens/settings/components/add_phone_number_settings.dart';
import '../screens/settings/components/pin_updated.dart';
import '../screens/settings/components/settings.dart';
import '../screens/settings/components/update_login_pin.dart';
import '../screens/settings/components/verification_successful_phone_settings.dart';
import '../screens/settings/components/verify_phone_number_settings.dart';
import '../screens/sign_in/components/sign_in.dart';
import '../screens/sign_up/components/add_phone_number.dart';
import '../screens/sign_up/components/sign_up.dart';
import '../screens/sign_up/components/verification_successful.dart';
import '../screens/sign_up/components/verify_phone_number.dart';
import '../screens/statement/components/statement.dart';

class AppPage{
  static String dashboard = "/";
  static String home = "/home";
  static String settings = "/settings";
  static String statement = "/statement";
  static String signIn = "/sign_in";
  static String signUp = "/sign_up";
  static String pinLogin = "/pin_login";
  static String addPhoneNumber = "/add_phone_number";
  static String verificationSuccessful = "/verification_successful";
  static String verifyPhoneNumber = "/verify_phone_number";
  static String updateLoginPin = "/update_login_pin";
  static String pinUpdated = "/pin_updated";
  static String addPhoneNumberSettings = "/add_phone_number_settings";
  static String verifyPhoneNumberSettings = "/verify_phone_number_settings";
  static String verificationSuccessfulNumberSettings = "/verification_successful_number_settings";

  static getDashboard() => dashboard;
  static getHome() => home;
  static getSettings() => settings;
  static getStatement() => statement;
  static getSignIn() => signIn;
  static getSignUp() => signUp;
  static getPinLogin() => pinLogin;
  static getAddPhoneNumber() => addPhoneNumber;
  static getVerificationSuccessful() => verificationSuccessful;
  static getVerifyPhoneNumber() => verifyPhoneNumber;
  static getUpdateLoginPin() => updateLoginPin;
  static getPinUpdated() => pinUpdated;
  static getAddPhoneNumberSettings() => addPhoneNumberSettings;
  static getVerifyPhoneNumberSettings() => verifyPhoneNumberSettings;
  static getVerificationSuccessfulNumberSettings() => verificationSuccessfulNumberSettings;

  static List<GetPage> routes = [
    GetPage(name: dashboard, page: () => const Dashboard()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: settings, page: () => const Settings()),
    GetPage(name: statement, page: () => const Statement()),
    GetPage(name: signIn, page: () => const SignIn()),
    GetPage(name: signUp, page: () => const SignUp()),
    GetPage(name: pinLogin, page: () => const PinLogin()),
    GetPage(name: addPhoneNumber, page: () => const AddPhoneNumber()),
    GetPage(name: verificationSuccessful, page: () => const VerificationSuccessful()),
    GetPage(name: verifyPhoneNumber, page: () => const VerifyPhoneNumber()),
    GetPage(name: updateLoginPin, page: () => const UpdateLoginPin()),
    GetPage(name: pinUpdated, page: () => const PinUpdated()),
    GetPage(name: addPhoneNumberSettings, page: () => const AddPhoneNumberSettings()),
    GetPage(name: verifyPhoneNumberSettings, page: () => const VerifyPhoneNumberSettings()),
    GetPage(name: verificationSuccessfulNumberSettings, page: () => const VerificationSuccessfulPhoneSettings())
  ];
}