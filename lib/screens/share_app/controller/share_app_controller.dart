import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:share/share.dart';

class ShareAppController extends GetxController{
  copyToClipBoard(String data){
    Clipboard.setData(ClipboardData(text: data));
  }
  shareApp(){
    Share.share(
      "Check out this awesome app!\n donwload it from play store https://bit.ly/HabaPay"
    );
  }
}