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
      accountBalance.value = (await _secureStorage.getAccountBalance())!;
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
      print("$confirmRecipientDetailsUrl${phoneNumberController.text}");
      try {
        var response = await BaseClient.get(
                "$confirmRecipientDetailsUrl${phoneNumberController.text}")
            .catchError((onError) {
          Get.showSnackbar(  const GetSnackBar(
            message: "Unknown error occurred",
            duration: Duration(seconds: 3),
          ));
        });

        var success = json.decode(response);

        if (success['success'] == true) {
          Get.to(() => const ConfirmDetails(),
              transition: Transition.rightToLeft,
              arguments: MoneyModel(
                  phoneNumber: success['data']['phone'],
                  recipient: success['data']['full_name'],
                  amount: amountController.text,
                  newBalance: "unavailable"
                  //newBalance: "${int.parse(accountBalance.value) - int.parse(amountController.text)}"
          ));
        } else {
          Get.showSnackbar( GetSnackBar(
            message: success['message'],
            duration: const Duration(seconds: 3),
          ));
        }
      } finally {
        isLoading(false);
      }
    }
  }

  onConfirmIdentityClicked() {
    Get.to(
      () => const VerifyingTransaction(),
      transition: Transition.rightToLeft,
    );
  }

  onVisibilityChanged() {
    isVisibilityOn.value = !isVisibilityOn.value;
  }

  onPopBackStack() {
    Get.back();
  }

  onConfirmDetailsSend(String recipientNumber, String amount) async {
    isLoading(true);
    try {
      var data = {
        'sender_phone': (await _secureStorage.getPhoneNumber()) ?? "",
        'receiver_phone': recipientNumber,
        'amount': amount
      };
      var response = await BaseClient.post(sendMoneyUrl, data)
          .catchError((onError) {
        Get.showSnackbar( GetSnackBar(
          message: onError.toString(),
          duration: Duration(seconds: 3),
        ));
      });

      print(response);
      var success = json.decode(response);

      if (success['success'] == true) {
        Get.showSnackbar(GetSnackBar(
          message: success['data']['transaction_message'],
          duration: const Duration(seconds: 3),
        ));
        Get.to(
          () => const SendMoneyConfirmIdentity(),
          transition: Transition.rightToLeft,
        );
      } else {
        Get.showSnackbar( GetSnackBar(
          message: success['message'],
          duration: const Duration(seconds: 3),
        ));
      }
    } finally {
      isLoading(false);
    }
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
  }
}
