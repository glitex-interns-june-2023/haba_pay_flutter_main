import 'package:get/get.dart';

class StatementController extends GetxController{
  var isAllPressed = false.obs;
  var isSentPressed = false.obs;
  var isWithdrawPressed = false.obs;
  var isDepositPressed = false.obs;

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