import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../model/MoneyModel.dart';
import '../../dashboard/components/dashboard.dart';
import '../components/confirm_details.dart';
import '../components/send_money_confirm_identity.dart';
import '../components/verifying_transaction.dart';

class SendMoneyController extends GetxController{
  var amountError = "".obs;
  var phoneNumberError = "".obs;
  var amountController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var isSuccessful = false.obs;
  var isLoading = false.obs;
  var accountBalance = "Ksh 800".obs;
  var isVisibilityOn = false.obs;

  onSendClicked(){
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError.value = "Enter a valid number";
    } else if (amountController.text.isEmpty) {
      amountError.value = "Enter a valid amount";
    } else {
      Get.to(() => const ConfirmDetails(),
          transition: Transition.rightToLeft,
          arguments: MoneyModel(
              phoneNumber:
              phoneNumberController.text,
              recipient: "Jane Makena",
              amount: amountController.text,
              newBalance: "800"));
    }
  }

  onConfirmIdentityClicked(){
    Get.to(()=> const VerifyingTransaction(), transition: Transition.rightToLeft,);
  }
  onVisibilityChanged(){
    isVisibilityOn.value = !isVisibilityOn.value;
  }

  onPopBackStack(){
    Get.back();
  }

  onConfirmDetailsSend(){
    Get.to(
          () => const SendMoneyConfirmIdentity(),
      transition: Transition.rightToLeft,
    );
  }

  onReturnHomeCLicked(){
    Get.offAll(
          () => const Dashboard(),
      transition: Transition.rightToLeft,
    );
  }

  verifyTransaction(){
    isLoading(true);
    try{
      isSuccessful(true);
    } finally{
      isLoading(false);
    }
  }
}