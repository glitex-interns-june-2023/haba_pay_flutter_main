import 'package:get/get.dart';

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

  confirmLoginPin() async{
    await _secureStorage.setPin(pin.string);
    Get.to(()=>const AddPhoneNumber(), transition: Transition.rightToLeft);
  }
}
