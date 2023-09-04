import 'dart:convert';

import 'package:get/get.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

import '../../../model/StatementModel.dart';
import '../../../services/base_client.dart';

class HomeController extends GetxController{
  final SecureStorage _secureStorage = SecureStorage();
  var isLoading = false.obs;
  var phoneNumber = "".obs;
  var initials = "".obs;
  var accountBalance = "Loading..".obs;
  var list = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading(true);
    try {
      phoneNumber.value = await _secureStorage.getPhoneNumber() ?? "";
      initials.value = await _secureStorage.getInitials() ?? "";
      var response = await BaseClient.get(
          "$walletBalanceUrl${await _secureStorage.getPhoneNumber()}");

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

      //===========================================
      //get list of statements
      //===========================================

      var listResponse = await BaseClient.get("$listUserTransactionsUrl${await _secureStorage.getUserId()}/transactions");
      print(listResponse);
      var listSuccess = json.decode(listResponse);

      if (listSuccess['success'] == true) {
        var dataList = [];
        dataList = listSuccess['data']['data'];
        if(dataList.isEmpty){
          print("empty array");
        } else {
          print(listSuccess['data']['data']);
          print("values");
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

  onVisibilityChanged(){
    isVisibilityOn.value = !isVisibilityOn.value;
  }

}