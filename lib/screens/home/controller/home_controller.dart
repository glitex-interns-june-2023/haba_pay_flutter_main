import 'package:get/get.dart';

import '../../../model/StatementModel.dart';

class HomeController extends GetxController{
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

  var accountBalance = "Ksh 90,000".obs;
  var isVisibilityOn = false.obs;

  onVisibilityChanged(){
    isVisibilityOn.value = !isVisibilityOn.value;
  }

}