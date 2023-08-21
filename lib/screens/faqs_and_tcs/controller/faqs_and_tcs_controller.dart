import 'package:get/get.dart';

import '../../../model/faq.dart';
import '../../../model/tcs.dart';

class FaqsAndTcsController extends GetxController{
  var tcList = [
    TcsModel("Term of use", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    TcsModel("Data privacy policy", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    TcsModel("Cookies policy", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
    TcsModel("User responsibility", "kgwdaueigfuiwefaf uewafiywefguywfegyufweifwe wfygywefeuywfegy feyuwefg"),
  ].obs;

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