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
  var isLoadingMore = false.obs;
  var isLoading = false.obs;
  var list = [].obs;
  var updatedList = [].obs;
  var isAllPressed = false.obs;
  var isSentPressed = false.obs;
  var isWithdrawPressed = false.obs;
  var isDepositPressed = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  Future<void> _scrollListener() async {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      page = page + 1;
      isLoadingMore(true);
      try {
        var listResponse = await BaseClient.get(
            "$listUserTransactionsUrl${await _secureStorage.getUserId()}/transactions?per_page=10&page=$page");
        var listSuccess = json.decode(listResponse);

        if (listSuccess['success'] == true) {
          List dataList = listSuccess['data']['data'];
          if (dataList.isEmpty) {
            list.addAll(dataList);
          } else {
            list.addAll(dataList);
          }
        } else {
          Get.showSnackbar(GetSnackBar(
            message: listSuccess['message'],
            duration: const Duration(seconds: 3),
          ));
        }
      } finally {
        isLoadingMore(false);
      }
      updatedList.addAll(list.toList());
    } else {

    }
  }

  onAllClicked() {
    updatedList.clear();
    updatedList.addAll(list.toList());
  }

  onSentClicked() {
    updatedList.clear();
    updatedList.addAll(list.where((transaction) {
      return transaction.statementList
          .any((statement) => statement.type == "send");
    }).map((transaction) {
      return TransactionModel(
          transaction.id,
          transaction.date,
          transaction.statementList
              .where((statement) => statement.type == "send")
              .toList());
    }).toList());
  }

  onWithdrawClicked() {
    updatedList.clear();
    updatedList.addAll(list.where((transaction) {
      return transaction.statementList
          .any((statement) => statement.type == "withdraw");
    }).map((transaction) {
      return TransactionModel(
          transaction.id,
          transaction.date,
          transaction.statementList
              .where((statement) => statement.type == "withdraw")
              .toList());
    }).toList());
  }

  onDepositClicked() {
    updatedList.clear();
    updatedList.addAll(list.where((transaction) {
      return transaction.statementList
          .any((statement) => statement.type == "deposit");
    }).map((transaction) {
      return TransactionModel(
          transaction.id,
          transaction.date,
          transaction.statementList
              .where((statement) => statement.type == "deposit")
              .toList());
    }).toList());
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
}
