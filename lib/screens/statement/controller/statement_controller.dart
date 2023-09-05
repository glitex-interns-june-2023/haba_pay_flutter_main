import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';
import '../../../model/TransactionModel.dart';
import '../../../services/base_client.dart';

class StatementController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final SecureStorage _secureStorage = SecureStorage();
  int page = 1;
  var hasMore = true.obs;
  var isLoadingMore = false.obs;
  var isLoading = false.obs;
  var list = <TransactionModel>[].obs;
  var moreList = <TransactionModel>[].obs;
  var isAllPressed = false.obs;
  var isSentPressed = false.obs;
  var isWithdrawPressed = false.obs;
  var isDepositPressed = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    scrollController.addListener(_scrollListener);
    hasMore(true);
    page = 1;
    isLoading(true);
    try {
      var listResponse = await BaseClient.get(
          "$listUserTransactionsUrl${await _secureStorage.getUserId()}/transactions?per_page=10&page=1");
      var listSuccess = json.decode(listResponse);
      if (listSuccess['success'] == true) {
        list.clear();
        List dataList = listSuccess['data']['data'];
        for (int i = 0; i < dataList.length; i++) {
          list.add(TransactionModel(
              dataList[i]['date'], dataList[i]['transactions']));
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

  apiListCall(String type) async {
    isLoading(true);
    try {
      var listResponse = await BaseClient.get(
          "$listUserTransactionsUrl${await _secureStorage.getUserId()}/transactions?per_page=10&page=1&type=$type");
      var listSuccess = json.decode(listResponse);
      if (listSuccess['success'] == true) {
        list.clear();
        List dataList = listSuccess['data']['data'];
        for (int i = 0; i < dataList.length; i++) {
          list.add(TransactionModel(
              dataList[i]['date'], dataList[i]['transactions']));
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

  Future<void> _scrollListener() async {
    if (isLoadingMore.value == true) return;
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      page++;
      isLoadingMore(true);
      try {
        var listResponse = await BaseClient.get(
            "$listUserTransactionsUrl${await _secureStorage.getUserId()}/transactions?per_page=10&page=$page");
        var listSuccess = json.decode(listResponse);

        var transactions = listSuccess['data']['data'][0]['transactions'] as List;
        if(transactions.length < 10){
          hasMore(false);
        }
        if (listSuccess['success'] == true) {
          List dataList = listSuccess['data']['data'];
          for (int i = 0; i < dataList.length; i++) {
            moreList.add(TransactionModel(
                dataList[i]['date'], dataList[i]['transactions']));
          }
          list.addAll(moreList);
        } else {
          Get.showSnackbar(GetSnackBar(
            message: listSuccess['message'],
            duration: const Duration(seconds: 3),
          ));
        }
      } finally {
        isLoadingMore(false);
      }
    } else {}
  }

  onAllClicked() {
    onInit();
  }

  onSentClicked() {
    apiListCall("sent");
  }

  onWithdrawClicked() {
    apiListCall("withdraw");
  }

  onDepositClicked() {
    apiListCall("deposit");
  }

  onButtonPressed(String title) {
    if (title == "All") {
      isAllPressed(true);
    } else if (title == "Sent") {
      isSentPressed(true);
    } else if (title == "Withdraw") {
      isWithdrawPressed(true);
    } else {
      isDepositPressed(true);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
