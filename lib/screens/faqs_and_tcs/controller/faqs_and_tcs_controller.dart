import 'package:get/get.dart';

class FaqsAndTcsController extends GetxController{
  var expandedFaqItems = <bool>[].obs;
  var expandedTcItems = <bool>[].obs;

  @override
  void onInit(){
    super.onInit();
    for(int i = 0; i < 3; i ++){
      expandedFaqItems.add(false);
    }
    for(int i = 0; i < 4; i ++){
      expandedTcItems.add(false);
    }
  }

  toggleFaqItem(int index){
    expandedFaqItems[index] = !expandedFaqItems[index];
  }

  toggleTcItem(int index){
    expandedTcItems[index] = !expandedTcItems[index];
  }
}