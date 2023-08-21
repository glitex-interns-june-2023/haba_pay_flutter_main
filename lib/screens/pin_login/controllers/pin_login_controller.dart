import 'package:get/get.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';
import 'package:haba_pay_main/screens/sign_up/components/confirm_login_pin.dart';

import '../../../services/pin_secure_storage.dart';


class PinLoginController extends GetxController{
  final SecureStorage _secureStorage = SecureStorage();
  var isAuthenticated = false.obs;
  var pin = [].obs;

  onNumberClicked(int number){
    if(pin.length == 4){
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Enter only 4 numbers',
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      pin.add(number);
    }
  }

  onClearLast(){
    if(pin.isEmpty){
      Get.showSnackbar(
        const GetSnackBar(
          message: 'All numbers are cleared',
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      pin.remove(pin.last);
    }
  }

  login() async{
    if(pin.length < 4){
      //enter four characters
    }
    //compare the pin with local storage pin
  }

  createLoginPin() async{
    if(pin.length < 4){
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Please enter 4 numbers',
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      await _secureStorage.setPin(pin.string);
      pin = [].obs;
      Get.offAll(()=>const ConfirmLoginPin(), transition: Transition.rightToLeft);
    }
  }

  confirmLoginPin() async{
    var finishPin = await _secureStorage.getPin();
    if(pin.length < 4){
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Please enter 4 numbers',
          duration: Duration(seconds: 3),
        ),
      );
    } else if(finishPin == pin.string){
      Get.offAll(()=>const Dashboard(), transition: Transition.rightToLeft);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Incorrect pin try again',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
