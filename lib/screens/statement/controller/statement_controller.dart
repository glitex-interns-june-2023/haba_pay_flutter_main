import 'package:get/get.dart';

import '../../../model/StatementModel.dart';
import '../../../model/TransactionModel.dart';

class StatementController extends GetxController{
  var list = [
    TransactionModel("2 February 2023", [
      StatementModel("Jane Mukenya", "deposit", "Ksh 400",
          "+254 787 787 879", "12:45 pm"),
      StatementModel("Jane jashas", "deposit", "Ksh 7568",
          "+254 787 787 879", "12:45 pm")
    ]),
    TransactionModel("1 February 2023", [
      StatementModel("Jane Mukenya", "send", "Ksh 653",
          "+254 787 787 879", "12:45 pm"),
      StatementModel("liadhjld Mukenya", "deposit",
          "Ksh 4535", "+254 787 787 879", "12:45 pm"),
      StatementModel("Jane dhladk", "withdraw", "Ksh 5667",
          "+254 787 787 879", "12:45 pm"),
    ])
  ].obs;
  var updatedList = [].obs;
  var isAllPressed = false.obs;
  var isSentPressed = false.obs;
  var isWithdrawPressed = false.obs;
  var isDepositPressed = false.obs;

  @override
  void onInit(){
    super.onInit();
    updatedList.addAll(list.toList());
  }

  onAllClicked(){
    updatedList.clear();
    updatedList.addAll(list.toList());
  }

  onSentClicked(){
    updatedList.clear();
    updatedList.addAll(
        list.where((transaction){
          return transaction.statementList.any((statement) => statement.type == "send");
        }).map((transaction){
          return TransactionModel(
              transaction.date,
              transaction.statementList.where((statement) => statement.type == "send").toList());
        }).toList()
    );
  }

  onWithdrawClicked(){
    updatedList.clear();
    updatedList.addAll(
        list.where((transaction){
          return transaction.statementList.any((statement) => statement.type == "withdraw");
        }).map((transaction){
          return TransactionModel(
              transaction.date,
              transaction.statementList.where((statement) => statement.type == "withdraw").toList());
        }).toList()
    );
  }

  onDepositClicked(){
    updatedList.clear();
    updatedList.addAll(
        list.where((transaction){
          return transaction.statementList.any((statement) => statement.type == "deposit");
        }).map((transaction){
          return TransactionModel(
              transaction.date,
              transaction.statementList.where((statement) => statement.type == "deposit").toList());
        }).toList()
    );
  }

  onButtonPressed(String title){
    if(title == "All"){
      isAllPressed(true);
    } else if (title == "Sent"){
      isSentPressed(true);
    } else if (title == "Withdraw"){
      isWithdrawPressed(true);
    } else {
      isDepositPressed(true);
    }
  }
}