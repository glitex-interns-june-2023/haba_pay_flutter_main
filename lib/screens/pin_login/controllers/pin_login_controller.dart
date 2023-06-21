import 'dart:math';

import 'package:get/get.dart';

class PinLoginController extends GetxController{
  var isAuthenticated = false.obs;
  var pin = [4].obs;

  onNumberClicked(int number){
    if(pin.length == 4){
      print("full");
    } else {
      pin.add(number);
    }
    print(pin);
  }

  onClearLast(){
    pin.remove(pin.last);
    print("last cleared");
    print(pin);
  }
  login() async{
    //compare the pin with local storage pin
  }
}
