import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';
import '../../../model/MoneyModel.dart';
import '../../../services/base_client.dart';
import '../../dashboard/components/dashboard.dart';
import '../components/deposit_confirm_details.dart';
import '../components/deposit_confirm_identity.dart';
import '../components/deposit_details.dart';
import '../components/deposit_verify_transaction.dart';

class DepositMoneyController extends GetxController {
  final SecureStorage _secureStorage = SecureStorage();
  var senderPhoneValue = "";
  var mpesaNumberValue = "";
  var amountValue = "";
  var phoneNumberError = "".obs;
  var amountError = "".obs;
  var depositDetailsAmountError = "".obs;
  var passwordError = "".obs;
  var passwordController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var amountController = TextEditingController();
  var depositDetailsAmountController = TextEditingController();
  var isSuccessful = false.obs;
  var isLoading = false.obs;
  var isVisibilityOn = false.obs;
  var accountBalance = "".obs;
  String balance = "";
  var myNumber = "".obs;
  var habaPay = "24356325".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading(true);
    try {
      accountBalance.value = await _secureStorage.getAccountBalance() ?? "";
      balance = accountBalance.value.substring(3,);
    } finally {
      isLoading(false);
    }
  }

  proceedWithNumber() async {
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError.value = "Enter phone number";
    } else if (amountController.text.isEmpty) {
      amountError.value = "Enter a valid amount";
    } else {
      Get.to(() => const DepositConfirmDetails(),
          transition: Transition.rightToLeft,
          arguments: MoneyModel(
              phoneNumber: phoneNumberController.text,
              recipient: "",
              amount: amountController.text,
              newBalance: "${int.parse(balance) - int.parse(amountController.text)}",
              payBillNumber: "12344 Habapay"));
    }
  }

  depositFromMpesa() async {
    if (depositDetailsAmountController.text.isEmpty) {
      depositDetailsAmountError.value = "Enter a valid amount";
    } else {
      Get.to(() => const DepositConfirmDetails(),
          transition: Transition.rightToLeft,
          arguments: MoneyModel(
              phoneNumber: await _secureStorage.getPhoneNumber() ?? "",
              recipient: "",
              amount: depositDetailsAmountController.text,
              newBalance: "${int.parse(balance) - int.parse(depositDetailsAmountController.text)}",
              payBillNumber: "${habaPay.value} habapay"));
    }
  }

  confirmIdentity() async {
    isLoading(true);
    try {
      var data = {
        'sender_phone': senderPhoneValue,
        'mpesa_number': mpesaNumberValue,
        'amount': amountValue
      };
      var response = await BaseClient.post(depositCashUrl, data);
      var success = json.decode(response);
      if (success['success'] == true) {
        isSuccessful(true);
        Get.to(
          () => const DepositVerifyTransaction(),
          transition: Transition.rightToLeft,
        );
      } else {
        Get.showSnackbar(GetSnackBar(
          message: success['message'],
          duration: const Duration(seconds: 3),
        ));
      }
    } finally {
      isLoading(false);
    }
  }

  confirm(String mpesaNumber, String amount) async {
    senderPhoneValue = await _secureStorage.getPhoneNumber() ?? "";
    mpesaNumberValue = mpesaNumber;
    amountValue = amount;
    if (passwordController.text.isEmpty) {
      passwordError.value = "Enter a valid password";
    } else {
      isLoading(true);
      try {
        var data = {
          'sender_phone': senderPhoneValue,
          'mpesa_number': mpesaNumberValue,
          'amount': amountValue
        };
        var response = await BaseClient.post(depositCashUrl, data);
        var success = json.decode(response);
        if (success['success'] == true) {
          isSuccessful(true);
          Get.to(
                () => const DepositVerifyTransaction(),
            transition: Transition.rightToLeft,
          );
        } else {
          Get.showSnackbar(GetSnackBar(
            message: success['message'],
            duration: const Duration(seconds: 3),
          ));
        }
      } finally {
        isLoading(false);
      }
    }
  }

  send(String mpesaNumber, String amount) async {
    senderPhoneValue = await _secureStorage.getPhoneNumber() ?? "";
    mpesaNumberValue = mpesaNumber;
    amountValue = amount;
    Get.to(
      () => const DepositConfirmIdentity(),
      transition: Transition.rightToLeft,
    );
  }

  popBackStack() {
    Get.back();
  }

  cancel() {
    Get.close(3);
  }

  useMyNumber() async {
    try {
      myNumber.value = (await _secureStorage.getPhoneNumber())!;
    } finally {
      Get.to(
            () => const DepositDetails(),
        transition: Transition.rightToLeft,
      );
    }
  }

  onReturnHomeCLicked() {
    Get.offAll(
      () => const Dashboard(),
      transition: Transition.rightToLeft,
    );
  }

  onVisibilityChanged() {
    isVisibilityOn.value = !isVisibilityOn.value;
  }

  verifyTransaction() {
    isLoading(true);
    try {
      isSuccessful(true);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
    passwordController.clear();
    phoneNumberController.clear();
    amountController.clear();
    depositDetailsAmountController.clear();
    phoneNumberError = "".obs;
    amountError = "".obs;
    depositDetailsAmountError = "".obs;
    passwordError = "".obs;
  }
}
