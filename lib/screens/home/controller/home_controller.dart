import 'dart:convert';

import 'package:get/get.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';
import '../../../model/StatementModel.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController {
  final SecureStorage _secureStorage = SecureStorage();
  var isLoading = false.obs;
  var phoneNumber = "".obs;
  var initials = "".obs;
  var accountBalance = "".obs;
  RxList<StatementModel> list = [StatementModel("", "", "", 0, "", "", "")].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading(true);
    try {
      accountBalance.value =
          await _secureStorage.getAccountBalance() ?? "Ksh 0";
      phoneNumber.value = await _secureStorage.getPhoneNumber() ?? "";
      initials.value = await _secureStorage.getInitials() ?? "";
      var response = await BaseClient.get(
          "$walletBalanceUrl${await _secureStorage.getPhoneNumber()}");

      var success = json.decode(response);

      if (success['success'] == true) {
        accountBalance.value =
            "${success['data']['currency']} ${success['data']['balance']}";
        await _secureStorage.setAccountBalance(
            "${success['data']['currency']} ${success['data']['balance']}");
      } else {
        Get.showSnackbar(GetSnackBar(
          message: success['message'],
          duration: const Duration(seconds: 3),
        ));
      }

      //===========================================
      //get list of statements
      //===========================================

      var listResponse = await BaseClient.get(
          "$listUserTransactionsUrl${await _secureStorage.getUserId()}/transactions");
      var listSuccess = json.decode(listResponse);

      if (listSuccess['success'] == true) {
        var data = listSuccess['data']['data'] as List;
        if (data.isEmpty) return;

        for (int i = 0; i < data.length; i++) {
          list.add(StatementModel(
              data[i]['transactions'][0]['transaction_id'].toString(),
              data[i]['transactions'][0]['full_name'],
              data[i]['transactions'][0]['type'],
              data[i]['transactions'][0]['amount'],
              data[i]['transactions'][0]['phone'],
              data[i]['transactions'][0]['timestamp'],
              data[i]['date']));
        }
      } else {
        Get.showSnackbar(GetSnackBar(
          message: listSuccess['message'],
          duration: const Duration(seconds: 3),
        ));
      }
    } finally {
      isLoading(false);
    }
  }

  var isVisibilityOn = false.obs;

  onVisibilityChanged() {
    isVisibilityOn.value = !isVisibilityOn.value;
  }
}
