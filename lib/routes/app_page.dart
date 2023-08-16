import 'package:get/get.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_confirm_details.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_confirm_identity.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_confirm_payment.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_money.dart';
import 'package:haba_pay_main/screens/deposit_money/components/deposit_verify_transaction.dart';
import 'package:haba_pay_main/screens/pin_login/components/pin_login.dart';
import 'package:haba_pay_main/screens/send_money/components/send_money.dart';
import 'package:haba_pay_main/screens/send_money/components/verifying_transaction.dart';
import 'package:haba_pay_main/screens/settings/components/verify_email.dart';
import 'package:haba_pay_main/screens/sign_up/components/confirm_login_pin.dart';
import 'package:haba_pay_main/screens/sign_up/components/create_login_pin.dart';
import 'package:haba_pay_main/screens/statement/components/transaction_details.dart';
import 'package:haba_pay_main/screens/withdraw_money/components/withdraw_confirm_details.dart';
import 'package:haba_pay_main/screens/withdraw_money/components/withdraw_money.dart';
import 'package:haba_pay_main/screens/withdraw_money/components/withdraw_to.dart';
import 'package:haba_pay_main/screens/withdraw_money/components/withdraw_verifying_transaction.dart';
import '../screens/dashboard/components/dashboard.dart';
import '../screens/deposit_money/components/deposit_details.dart';
import '../screens/home/components/home.dart';
import '../screens/send_money/components/confirm_details.dart';
import '../screens/send_money/components/send_money_confirm_identity.dart';
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
  static String createLoginPin = "/create_login_pin";
  static String confirmLoginPin = "/confirm_login_pin";
  static String addPhoneNumber = "/add_phone_number";
  static String verificationSuccessful = "/verification_successful";
  static String verifyPhoneNumber = "/verify_phone_number";
  static String updateLoginPin = "/update_login_pin";
  static String pinUpdated = "/pin_updated";
  static String addPhoneNumberSettings = "/add_phone_number_settings";
  static String verifyPhoneNumberSettings = "/verify_phone_number_settings";
  static String verificationSuccessfulNumberSettings = "/verification_successful_number_settings";
  static String sendMoney = "/send_money";
  static String confirmDetails = "/confirm_details";
  static String sendMoneyConfirmIdentity = "/send_money_confirm_identity";
  static String verifyingTransaction = "/verifying_transaction";
  static String depositMoney = "/deposit_money";
  static String depositDetails = "/deposit_details";
  static String depositConfirmDetails = "/deposit_confirm_details";
  static String depositConfirmIdentity = "/deposit_confirm_identity";
  static String depositConfirmPayment = "/deposit_confirm_payment";
  static String depositVerifyTransaction = "/deposit_verify_transaction";
  static String withdrawMoney = "/withdraw_money";
  static String withdrawTo = "/withdraw_to";
  static String withdrawConfirmDetails = "/withdraw_confirm_details";
  static String withdrawVerifyTransaction = "/withdraw_verify_transaction";
  static String transactionDetails = "/transaction_details";
  static String verifyEmail = "/verify_email";

  static getDashboard() => dashboard;
  static getHome() => home;
  static getSettings() => settings;
  static getStatement() => statement;
  static getSignIn() => signIn;
  static getSignUp() => signUp;
  static getPinLogin() => pinLogin;
  static getCreateLoginPin() => createLoginPin;
  static getConfirmLoginPin() => confirmLoginPin;
  static getAddPhoneNumber() => addPhoneNumber;
  static getVerificationSuccessful() => verificationSuccessful;
  static getVerifyPhoneNumber() => verifyPhoneNumber;
  static getUpdateLoginPin() => updateLoginPin;
  static getPinUpdated() => pinUpdated;
  static getAddPhoneNumberSettings() => addPhoneNumberSettings;
  static getVerifyPhoneNumberSettings() => verifyPhoneNumberSettings;
  static getVerificationSuccessfulNumberSettings() => verificationSuccessfulNumberSettings;
  static getSendMoney() => sendMoney;
  static getConfirmDetails() => confirmDetails;
  static getSendMoneyConfirmIdentity() => sendMoneyConfirmIdentity;
  static getVerifyingTransaction() => verifyingTransaction;
  static getDepositMoney() => depositMoney;
  static getDepositDetails() => depositDetails;
  static getDepositConfirmDetails() => depositConfirmDetails;
  static getDepositConfirmIdentity() => depositConfirmIdentity;
  static getDepositConfirmPayment() => depositConfirmPayment;
  static getDepositVerifyTransaction() => depositVerifyTransaction;
  static getWithdrawMoney() => withdrawMoney;
  static getWithdrawTo() => withdrawTo;
  static getWithdrawConfirmDetails() => withdrawConfirmDetails;
  static getWithdrawVerifyTransaction() => withdrawVerifyTransaction;
  static getTransactionDetails() => transactionDetails;
  static getVerifyEmail() => verifyEmail;

  static List<GetPage> routes = [
    GetPage(name: dashboard, page: () => const Dashboard()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: settings, page: () => const Settings()),
    GetPage(name: statement, page: () => const Statement()),
    GetPage(name: signIn, page: () => const SignIn()),
    GetPage(name: signUp, page: () => const SignUp()),
    GetPage(name: pinLogin, page: () => const PinLogin()),
    GetPage(name: createLoginPin, page: ()=> const CreateLoginPin()),
    GetPage(name: confirmLoginPin, page: ()=> const ConfirmLoginPin()),
    GetPage(name: addPhoneNumber, page: () => const AddPhoneNumber()),
    GetPage(name: verificationSuccessful, page: () => const VerificationSuccessful()),
    GetPage(name: verifyPhoneNumber, page: () => const VerifyPhoneNumber()),
    GetPage(name: updateLoginPin, page: () => const UpdateLoginPin()),
    GetPage(name: pinUpdated, page: () => const PinUpdated()),
    GetPage(name: addPhoneNumberSettings, page: () => const AddPhoneNumberSettings()),
    GetPage(name: verifyPhoneNumberSettings, page: () => const VerifyPhoneNumberSettings()),
    GetPage(name: verificationSuccessfulNumberSettings, page: () => const VerificationSuccessfulPhoneSettings()),
    GetPage(name: sendMoney, page: () => const SendMoney()),
    GetPage(name: confirmDetails, page: () => const ConfirmDetails()),
    GetPage(name: sendMoneyConfirmIdentity, page: () => const SendMoneyConfirmIdentity()),
    GetPage(name: verifyingTransaction, page: () => const VerifyingTransaction()),
    GetPage(name: depositMoney, page: () => const DepositMoney()),
    GetPage(name: depositDetails, page: () => const DepositDetails()),
    GetPage(name: depositConfirmDetails, page: () => const DepositConfirmDetails()),
    GetPage(name: depositConfirmIdentity, page: () => const DepositConfirmIdentity()),
    GetPage(name: depositConfirmPayment, page: () => const DepositConfirmPayment()),
    GetPage(name: depositVerifyTransaction, page: () => const DepositVerifyTransaction()),
    GetPage(name: withdrawMoney, page: () => const WithdrawMoney()),
    GetPage(name: withdrawTo, page: () => const WithdrawTo()),
    GetPage(name: withdrawConfirmDetails, page: () => const WithdrawConfirmDetails()),
    GetPage(name: withdrawVerifyTransaction, page: () => const WithdrawVerifyingTransaction()),
    GetPage(name: transactionDetails, page: () => const TransactionDetails()),
    GetPage(name: verifyEmail, page: () => const VerifyEmail())
  ];
}