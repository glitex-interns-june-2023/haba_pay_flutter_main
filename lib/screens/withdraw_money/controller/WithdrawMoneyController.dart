
import 'package:get/get.dart';

class WithdrawMoneyController extends GetxController{
  var isSuccessful = false.obs;
  var isLoading = false.obs;

  verifyTransaction(){
    isLoading(true);
    try{
      isSuccessful(true);
    } finally{
      isLoading(false);
    }
  }
}