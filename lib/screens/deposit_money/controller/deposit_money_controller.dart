import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../model/MoneyModel.dart';
import '../components/deposit_confirm_details.dart';
import '../components/deposit_details.dart';

class DepositMoneyController extends GetxController {
  var phoneNumberError = "".obs;
  var amountError = "".obs;
  var phoneNumberController = TextEditingController();
  var amountController = TextEditingController();
  var isSuccessful = false.obs;
  var isLoading = false.obs;
  var isVisibilityOn = false.obs;
  var accountBalance = "Ksh 800".obs;
  var number = "+254 768 894 90".obs;
  var habaPay = "24356325".obs;

  proceedWithNumber() {
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError.value = "Enter phone number";
    } else if (amountController.text.isEmpty) {
      amountError.value = "Enter amount";
    } else {
      Get.to(() => const DepositConfirmDetails(),
          transition: Transition.rightToLeft,
          arguments: MoneyModel(
              phoneNumber: phoneNumberController.text,
              recipient: "Jane Makena",
              amount: amountController.text,
              newBalance: "800",
              payBillNumber: "12344 Habapay"));
    }
  }

  useMyNumber() {
    Get.to(
      () => const DepositDetails(),
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
