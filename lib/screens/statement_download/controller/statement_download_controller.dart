import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class StatementDownloadController extends GetxController{
  var transactionTypeList = [
    "Select",
    "transaction type1",
    "transaction type2",
    "transaction type3",
    "transaction type4"
  ].obs;

  var durationList = [
    "Select",
    "duration type1",
    "duration type2",
    "duration type3",
    "duration type4"
  ].obs;

  var downloadMethodList = [
    "Select",
    "method type1",
    "method type2",
    "method type3",
    "method type4"
  ].obs;

  var isLoading = false.obs;
  var isDownloaded = false.obs;
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

  downloadingStatement(){
    isLoading(true);
    try{
      isDownloaded(true);
    } finally {
      isLoading(false);
    }
  }
}