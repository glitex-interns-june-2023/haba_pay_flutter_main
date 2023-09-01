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
  var myNumber = "".obs;
  var habaPay = "24356325".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading(true);
    try {
      accountBalance.value = await _secureStorage.getAccountBalance() ?? "";
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
              //newBalance: "${int.parse(accountBalance.value) - int.parse(amountController.text)}"
              newBalance: "800",
              payBillNumber: "12344 Habapay"));
    }
  }

  depositFromMpesa() async {
    if (depositDetailsAmountController.text.isEmpty) {
      depositDetailsAmountError.value = "Enter a valid amount";
    } else {
      isLoading(true);
      try {
        var response = await BaseClient.get(
            "$confirmRecipientDetailsUrl${phoneNumberController.text}");

        var success = json.decode(response);

        if (success['success'] == true) {
          Get.to(() => const DepositConfirmDetails(),
              transition: Transition.rightToLeft,
              arguments: MoneyModel(
                  phoneNumber: await _secureStorage.getPhoneNumber() ?? "",
                  recipient: "Jane Makena",
                  amount: depositDetailsAmountController.text,
                  newBalance: "800",
                  payBillNumber: "${habaPay.value} habapay"));
          // Get.to(() => const ConfirmDetails(),
          //     transition: Transition.rightToLeft,
          //     arguments: MoneyModel(
          //         phoneNumber: success['data']['phone'],
          //         recipient: success['data']['full_name'],
          //         amount: amountController.text,
          //         newBalance: "unavailable"
          //       //newBalance: "${int.parse(accountBalance.value) - int.parse(amountController.text)}"
          //     ));
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

  confirmIdentity() async {
    isLoading(true);
    try {
      var data = {
        'sender_phone': (await _secureStorage.getPhoneNumber()) ?? "",
        'receiver_phone': phoneNumberController.text,
        'amount': amountController.text
      };
      var response = await BaseClient.post(sendMoneyUrl, data);
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

  confirm() {
    if (passwordController.text.isEmpty) {
      passwordError.value = "Enter a valid password";
    } else {
      Get.to(
        () => const DepositVerifyTransaction(),
        transition: Transition.rightToLeft,
      );
    }
  }

  send() {
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
    isLoading(true);
    try {
      myNumber.value = await _secureStorage.getPhoneNumber() ?? "";
      Get.to(
        () => const DepositDetails(),
        transition: Transition.rightToLeft,
      );
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
}
