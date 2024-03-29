import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:haba_pay_main/services/base_client.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';
import '../../../model/MoneyModel.dart';
import '../../dashboard/components/dashboard.dart';
import '../components/confirm_details.dart';
import '../components/send_money_confirm_identity.dart';
import '../components/verifying_transaction.dart';

class SendMoneyController extends GetxController {
  final SecureStorage _secureStorage = SecureStorage();
  String balance = "";
  String amountValue = "";
  String recipientNumberValue = "";
  var amountError = "".obs;
  var phoneNumberError = "".obs;
  var amountController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var isSuccessful = false.obs;
  var isLoading = false.obs;
  var accountBalance = "".obs;
  var isVisibilityOn = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading(true);
    try {
      accountBalance.value = await _secureStorage.getAccountBalance() ?? "";
      balance = accountBalance.value.substring(
        3,
      );
    } finally {
      isLoading(false);
    }
  }

  onSendClicked() async {
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError.value = "Enter a valid number";
    } else if (amountController.text.isEmpty) {
      amountError.value = "Enter a valid amount";
    } else {
      isLoading(true);
      try {
        var response = await BaseClient.get(
            "$confirmRecipientDetailsUrl${phoneNumberController.text}");

        var success = json.decode(response);

        if (success['success'] == true) {
          Get.to(() => const ConfirmDetails(),
              transition: Transition.rightToLeft,
              arguments: MoneyModel(
                  phoneNumber: success['data']['phone'],
                  recipient: success['data']['full_name'],
                  amount: amountController.text,
                  newBalance:
                      "Ksh ${int.parse(balance) - int.parse(amountController.text)}"));
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

  onConfirmIdentityClicked() async {
    isLoading(true);
    try {
      var data = {
        'sender_phone': (await _secureStorage.getPhoneNumber()) ?? "",
        'receiver_phone': recipientNumberValue,
        'amount': amountValue
      };
      var response = await BaseClient.post(sendMoneyUrl, data);
      var success = json.decode(response);
      if (success['success'] == true) {
        isSuccessful(true);
        Get.showSnackbar(GetSnackBar(
          message: success['data']['transaction_message'],
          duration: const Duration(seconds: 3),
        ));
        Get.to(
          () => const VerifyingTransaction(),
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

  onVisibilityChanged() {
    isVisibilityOn.value = !isVisibilityOn.value;
  }

  onPopBackStack() {
    Get.back();
  }

  onConfirmDetailsSend(String recipientNumber, String amount) async {
    recipientNumberValue = recipientNumber;
    amountValue = amount;
    Get.to(
      () => const SendMoneyConfirmIdentity(),
      transition: Transition.rightToLeft,
    );
  }

  onReturnHomeCLicked() {
    Get.offAll(
      () => const Dashboard(),
      transition: Transition.rightToLeft,
    );
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
    phoneNumberController.clear();
    amountController.clear();
    amountError = "".obs;
    phoneNumberError = "".obs;
  }
}
