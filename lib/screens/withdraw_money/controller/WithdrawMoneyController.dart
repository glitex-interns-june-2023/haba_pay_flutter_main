import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/model/WithdrawCashModel.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';
import '../../../model/ConfirmRecipientDetailsModel.dart';
import '../../../model/MoneyModel.dart';
import '../../../services/base_client.dart';
import '../../dashboard/components/dashboard.dart';
import '../components/withdraw_confirm_details.dart';
import '../components/withdraw_confirm_identity.dart';
import '../components/withdraw_money.dart';
import '../components/withdraw_to.dart';
import '../components/withdraw_verifying_transaction.dart';

class WithdrawMoneyController extends GetxController {
  final SecureStorage _secureStorage = SecureStorage();
  var senderPhone = "";
  var receiverPhone = "";
  var amount = "";
  var withdrawToPhoneNumber = "+254 789 894 585".obs;
  var phoneNumberError = "".obs;
  var amountError = "".obs;
  var withdrawToAmountError = "".obs;
  var withdrawToAmountController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var amountController = TextEditingController();
  var accountBalance = "Ksh 800".obs;
  var isSuccessful = false.obs;
  var isLoading = false.obs;
  var isVisibilityOn = false.obs;

  onProceedWithNumberClicked() async {
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
          Get.to(() => const WithdrawConfirmDetails(),
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

  onDepositFromMpesaClicked() async {
    if (withdrawToAmountController.text.isEmpty) {
      withdrawToAmountError.value = "Enter a valid amount";
    } else {
      isLoading(true);
      try {
        var response = await BaseClient.get(
            "/v1/wallet/confirm-details/phone?=${await _secureStorage.getPhoneNumber()}")
            .catchError((onError) {
          Get.showSnackbar(const GetSnackBar(
            message: "Unknown Error Occurred",
            duration: Duration(seconds: 3),
          ));
        });

        var success = ConfirmRecipientDetailsModel.fromJson(response);

        if (success.success == true) {
          Get.to(() => const WithdrawConfirmDetails(),
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

  onCallSupportClicked() {}

  onReturnHomeClicked() {
    Get.offAll(
      () => const Dashboard(),
      transition: Transition.rightToLeft,
    );
  }

  onNewNumberClicked() {
    Get.to(
      () => const WithdrawMoney(),
      transition: Transition.rightToLeft,
    );
  }

  onUseNumber() {
    Get.to(() => const WithdrawTo(), transition: Transition.rightToLeft);
  }

  onVisibilityChanged() {
    isVisibilityOn.value = !isVisibilityOn.value;
  }

  onConfirmDetailsClicked(String senderPhone, String receiverPhone, String amount) {
    senderPhone = senderPhone;
    receiverPhone = receiverPhone;
    amount = amount;
    Get.to(
          () => const WithdrawConfirmIdentity(),
      transition: Transition.rightToLeft,
    );
  }

  onConfirmIdentityClicked() async {
    isLoading(true);
    try {
      var response = await BaseClient.post(
          "/v1/wallet/withdraw",
          WithdrawCashModel(senderPhone: senderPhone, receiverPhone: receiverPhone, amount: amount)
      )
          .catchError((onError) {
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown Error Occurred",
          duration: Duration(seconds: 3),
        ));
      });

      var success = ConfirmRecipientDetailsModel.fromJson(response);

      if (success.success == true) {
        Get.to(
              () => const WithdrawVerifyingTransaction(),
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

  onPopBackStack() {
    Get.back();
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
