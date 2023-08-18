import 'package:get/get.dart';

import '../../../model/faq.dart';

class FaqsAndTcsController extends GetxController{
  var list = [
    Faq("How do i complete my profile", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    Faq("Do i have to add my business", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    Faq("Can i download all my records", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
  ].obs;

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