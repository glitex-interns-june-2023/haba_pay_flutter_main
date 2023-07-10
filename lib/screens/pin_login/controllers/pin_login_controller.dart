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
      //array is full
    } else {
      pin.add(number);
    }
  }

  onClearLast(){
    if(pin.isEmpty){
      //all cleared
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
    await _secureStorage.setPin(pin.string);
    pin = [].obs;
    Get.to(()=>const ConfirmLoginPin(), transition: Transition.rightToLeft);
  }

  confirmLoginPin() async{
    var finishPin = await _secureStorage.getPin();
    if(finishPin == pin.string){
      Get.to(()=>const Dashboard(), transition: Transition.rightToLeft);
    } else {
      pin = [].obs;
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Incorrect pin try again',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
