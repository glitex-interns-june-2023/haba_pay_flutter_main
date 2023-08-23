import 'package:get/get.dart';

import '../../services/pin_secure_storage.dart';

class SharedPinController extends GetxController{
  final SecureStorage _secureStorage = SecureStorage();
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

  confirmLoginPin(Function() onConfirm) async{
    var finishPin = await _secureStorage.getPin();
    if(pin.length < 4){
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Please enter 4 numbers',
          duration: Duration(seconds: 3),
        ),
      );
    } else if(finishPin == pin.string){
      onConfirm();
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