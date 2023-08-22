import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../model/MoneyModel.dart';
import '../../dashboard/components/dashboard.dart';
import '../components/deposit_confirm_details.dart';
import '../components/deposit_confirm_identity.dart';
import '../components/deposit_confirm_payment.dart';
import '../components/deposit_details.dart';
import '../components/deposit_verify_transaction.dart';

class DepositMoneyController extends GetxController {
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
  var accountBalance = "Ksh 800".obs;
  var number = "+254 768 894 90".obs;
  var habaPay = "24356325".obs;

  proceedWithNumber() {
    if (phoneNumberController.text.isEmpty) {
      phoneNumberError.value = "Enter phone number";
    } else if (amountController.text.isEmpty) {
      amountError.value = "Enter a valid amount";
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

  depositFromMpesa() {
    if (depositDetailsAmountController.text.isEmpty) {
      depositDetailsAmountError.value = "Enter a valid amount";
    } else {
      Get.to(() => const DepositConfirmDetails(),
          transition: Transition.rightToLeft,
          arguments: MoneyModel(
              phoneNumber: number.value,
              recipient: "Jane Makena",
              amount: depositDetailsAmountController.text,
              newBalance: "800",
              payBillNumber: "${habaPay.value} habapay"));
    }
  }

  confirmIdentity(){
    Get.to(()=> const DepositConfirmPayment(),
      transition: Transition.rightToLeft,
    );
  }

  confirm(){
    if (passwordController.text.isEmpty) {
      passwordError.value = "Enter a valid password";
    } else {
      Get.to(
            () => const DepositVerifyTransaction(),
        transition: Transition.rightToLeft,
      );
    }
  }

  send(){
    Get.to(
          () => const DepositConfirmIdentity(),
      transition: Transition.rightToLeft,
    );
  }

  popBackStack() {
    Get.back();
  }

  cancel(){
    Get.close(3);
  }

  useMyNumber() {
    Get.to(
      () => const DepositDetails(),
      transition: Transition.rightToLeft,
    );
  }

  onReturnHomeCLicked(){
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
