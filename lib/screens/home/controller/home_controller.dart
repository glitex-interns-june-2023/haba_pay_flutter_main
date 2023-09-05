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
          "$listUserTransactionsUrl${await _secureStorage.getUserId()}/transactions?per_page=10&page=1");
      var listSuccess = json.decode(listResponse);

      if (listSuccess['success'] == true) {
        list.clear();
        var data = listSuccess['data']['data'] as List;
        if (data.isEmpty) return;
        for (int i = 0; i <= data.length; i++) {
          list.add(StatementModel(
              data[0]['transactions'][i]['transaction_id'].toString(),
              data[0]['transactions'][i]['full_name'],
              data[0]['transactions'][i]['type'],
              data[0]['transactions'][i]['amount'],
              data[0]['transactions'][i]['phone'],
              data[0]['transactions'][i]['timestamp'],
              data[0]['date']));
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
