import 'package:get/get.dart';

class SendMoneyController extends GetxController{
  var isSuccessful = false.obs;
  var isLoading = false.obs;
  var accountBalance = "Ksh 800".obs;
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