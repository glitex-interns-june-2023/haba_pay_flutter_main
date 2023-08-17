import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StatementDownloadController extends GetxController{
  var transactionType = "Select".obs;
  var duration = "Select".obs;
  var downloadMethod = "Select".obs;
  var isFilterClicked = false.obs;

  onFilterClicked(){
    isFilterClicked.value = !isFilterClicked.value;
  }

  updateTransactionType(String value){
    transactionType.value = value;
  }

  updateDuration(String value){
    duration.value = value;
  }

  updateDownload(String value){
    downloadMethod.value = value;
  }
}