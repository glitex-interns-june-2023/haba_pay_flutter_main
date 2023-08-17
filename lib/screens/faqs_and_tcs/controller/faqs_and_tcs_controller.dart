import 'package:get/get.dart';

class FaqsAndTcsController extends GetxController{
  var expandedItems = <bool>[].obs;

  toggleItem(int index){
    expandedItems[index] = !expandedItems[index];
  }
}