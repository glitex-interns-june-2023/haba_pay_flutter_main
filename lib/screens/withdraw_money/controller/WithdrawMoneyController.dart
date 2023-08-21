
import 'package:get/get.dart';

class WithdrawMoneyController extends GetxController{
  var accountBalance = "".obs;
  var isSuccessful = false.obs;
  var isLoading = false.obs;
  var isVisibilityOn = false.obs;

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