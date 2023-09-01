import 'dart:convert';

import 'package:get/get.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

import '../../../model/StatementModel.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController{
  final SecureStorage _secureStorage = SecureStorage();
  var isLoading = false.obs;
  var phoneNumber = "+254 767 784 774".obs;
  var accountBalance = "Refresh".obs;
  var list = [
    StatementModel(22,"Jane Mukenya", 'deposit', "Ksh 400",
        "+254 787 787 879", "12:45 pm"),
    StatementModel(56,"Jane jashas", 'deposit.svg', "Ksh 7568",
        "+254 787 787 879", "12:45 pm"),
    StatementModel(78,"Jane Mukenya", 'send.svg', "Ksh 653",
        "+254 787 787 879", "12:45 pm"),
    StatementModel(67,"liadhjld Mukenya", 'deposit',
        "Ksh 4535", "+254 787 787 879", "12:45 pm"),
    StatementModel(56, "Jane dhladk", 'withdraw', "Ksh 5667",
        "+254 787 787 879", "12:45 pm"),
  ].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading(true);
    try {
      phoneNumber.value = (await _secureStorage.getPhoneNumber())!;
      var response = await BaseClient.get(
          "$walletBalanceUrl${await _secureStorage.getPhoneNumber()}")
          .catchError((onError) {
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown error occurred",
          duration: Duration(seconds: 3),
        ));
      });

      var success = json.decode(response);

      if (success['success'] == true) {
        accountBalance.value = "${success['data']['currency']} ${success['data']['balance']}";
        await _secureStorage.setAccountBalance("${success['data']['currency']} ${success['data']['balance']}");
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

  var isVisibilityOn = false.obs;

  onVisibilityChanged(){
    isVisibilityOn.value = !isVisibilityOn.value;
  }

}