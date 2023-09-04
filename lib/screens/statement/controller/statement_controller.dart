import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/model/StatementModel.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

import '../../../model/TransactionModel.dart';
import '../../../services/base_client.dart';

class StatementController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final SecureStorage _secureStorage = SecureStorage();
  int page = 1;
  var isLoadingMore = false.obs;
  var isLoading = false.obs;
  var list = [
    TransactionModel("", [StatementModel("", "", "", 0, "", "", "")])
  ].obs;
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
    if (isLoadingMore.value == true) return;
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      page++;
      isLoadingMore(true);
      try {
        var listResponse = await BaseClient.get(
            "$listUserTransactionsUrl${await _secureStorage.getUserId()}/transactions?per_page=10&page=$page");
        var listSuccess = json.decode(listResponse);

        if (listSuccess['success'] == true) {
          list.clear();
          var dataList = listSuccess['data']['data'];
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
        isLoadingMore(false);
      }
      updatedList.addAll(list.toList());
    } else {}
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
