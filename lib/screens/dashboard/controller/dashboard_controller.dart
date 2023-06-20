import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  var tabIndex = 0.obs;

  void changeTabIndex(int index){
    tabIndex.value = index;
  }
}