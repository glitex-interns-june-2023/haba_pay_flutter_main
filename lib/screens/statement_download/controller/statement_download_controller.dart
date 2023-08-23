import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/StatementDownloadModel.dart';
import '../../dashboard/components/dashboard.dart';
import '../components/statement_confirmation.dart';
import '../components/statement_download_confirm_identity.dart';
import '../components/statement_preparing_download.dart';

class StatementDownloadController extends GetxController {
  var fromError = "".obs;
  var toError = "".obs;
  var transactionTypeError = "".obs;
  var durationError = "".obs;
  var downloadMethodError = "".obs;

  var fromController = TextEditingController();
  var toController = TextEditingController();

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

  onConfirmClicked(){
    if(transactionType.value == "Select"){
      transactionTypeError.value = "Select a valid value";
    } else if(duration.value == "Select" && isFilterClicked.value == false){
      durationError.value = "Select a valid value";
    } else if(fromController.text.isEmpty && isFilterClicked.value == true){
      fromError.value = "Enter a from value";
    } else if(toController.text.isEmpty && isFilterClicked.value == true){
      toError.value = "Enter a to value";
    } else if(downloadMethod.value == "Select"){
      downloadMethodError.value = "Select a valid value";
    } else {
      Get.to(() => const StatementConfirmation(),
          transition: Transition.rightToLeft,
          arguments: StatementDownloadModel(
              transactionType.value,
              duration.value == "Select"
                  ? " ${fromController.text} ${toController.text}"
                  : duration.value,
              downloadMethod.value
          )
      );
    }
  }

  onCallSupportClicked(){

  }

  onReturnHomeClicked(){
    Get.offAll(() => const Dashboard(),
      transition: Transition.rightToLeft,
    );
  }

  onDownloadClicked(){
    Get.to(() => const StatementDownloadConfirmIdentity(),
      transition: Transition.rightToLeft,
    );
  }

  onConfirmIdentityClicked(){
    Get.to(() => const StatementPreparingDownload(),
      transition: Transition.rightToLeft,
    );
  }

  onFilterClicked() {
    isFilterClicked.value = !isFilterClicked.value;
  }

  updateTransactionType(String value) {
    transactionType.value = value;
  }

  updateDuration(String value) {
    duration.value = value;
  }

  updateDownload(String value) {
    downloadMethod.value = value;
  }

  downloadingStatement() {
    isLoading(true);
    try {
      isDownloaded(true);
    } finally {
      isLoading(false);
    }
  }
}
