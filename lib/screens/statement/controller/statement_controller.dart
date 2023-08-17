import 'package:get/get.dart';

import '../../../model/StatementModel.dart';
import '../../../model/TransactionModel.dart';

class StatementController extends GetxController{
  List<TransactionModel> list = [
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
  var isAllPressed = false.obs;
  var isSentPressed = false.obs;
  var isWithdrawPressed = false.obs;
  var isDepositPressed = false.obs;

  onAllClicked(){
    list.obs.value = list.toList();
  }

  onSentClicked(){
    list.obs.value = list.where((transaction){
      return transaction.statementList.any((statement) => statement.type == "sent");
    }).toList();
  }

  onWithdrawClicked(){
    list.obs.value = list.where((transaction){
      return transaction.statementList.any((statement) => statement.type == "withdraw");
    }).toList();
  }

  onDepositClicked(){
    list.obs.value = list.where((transaction){
      return transaction.statementList.any((statement) => statement.type == "deposit");
    }).toList();
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