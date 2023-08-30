import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:haba_pay_main/model/ConfirmRecipientDetailsModel.dart';
import 'package:haba_pay_main/model/SendMoneyModel.dart';
import 'package:haba_pay_main/model/SendMoneyResponseModel.dart';
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
  var accountBalance = "Loading".obs;
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
      try {
        var response = await BaseClient.get(
                "/v1/wallet/confirm-details/phone?=${phoneNumberController.text}")
            .catchError((onError) {
          Get.showSnackbar(const GetSnackBar(
            message: "Unknown Error Occurred",
            duration: Duration(seconds: 3),
          ));
        });

        var success = ConfirmRecipientDetailsModel.fromJson(response);

        if (success.success == true) {
          Get.to(() => const ConfirmDetails(),
              transition: Transition.rightToLeft,
              arguments: MoneyModel(
                  phoneNumber: success.data.phone,
                  recipient: success.data.fullName,
                  amount: amountController.text,
                  newBalance:
                      "${int.parse(accountBalance.value) - int.parse(amountController.text)}"));
        } else {
          Get.showSnackbar(const GetSnackBar(
            message: "Unknown Error Occurred",
            duration: Duration(seconds: 3),
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
      var response = await BaseClient.post(
              "/v1/wallet/send-money",
              SendMoneyModel(
                  senderPhone: (await _secureStorage.getPhoneNumber())!,
                  receiverPhone: recipientNumber,
                  amount: amount))
          .catchError((onError) {
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown Error Occurred",
          duration: Duration(seconds: 3),
        ));
      });

      var success = SendMoneyResponseModel.fromJson(response);

      if (success.success == true) {
        Get.showSnackbar(GetSnackBar(
          message: success.data.transactionMessage,
          duration: const Duration(seconds: 3),
        ));
        Get.to(
          () => const SendMoneyConfirmIdentity(),
          transition: Transition.rightToLeft,
        );
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown Error Occurred",
          duration: Duration(seconds: 3),
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
}
