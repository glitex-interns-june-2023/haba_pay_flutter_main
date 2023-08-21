import 'package:get/get.dart';

class DepositMoneyController extends GetxController{
  var isSuccessful = false.obs;
  var isLoading = false.obs;
  var isVisibilityOn = false.obs;
  var accountBalance = "Ksh 800".obs;
  var number = "+254 768 894 90".obs;
  var habaPay = "24356325".obs;

  onVisibilityChanged(){
    isVisibilityOn.value = !isVisibilityOn.value;
  }

  verifyTransaction(){
    isLoading(true);
    try{
      isSuccessful(true);
    } finally{
      isLoading(false);
    }
  }
}