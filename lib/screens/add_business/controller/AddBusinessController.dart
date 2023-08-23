import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../dashboard/components/dashboard.dart';
import '../components/add_business_successful.dart';

class AddBusinessController extends GetxController {
  var businessNameError = "".obs;
  var locationError = "".obs;
  var dropDownError = "".obs;

  var businessNameController = TextEditingController();
  var locationController = TextEditingController();
  var dropDownValue = "Select".obs;

  var items = ["Select", "item1", "item2"].obs;

  onChanged(String value) {
    dropDownValue.value = value;
  }

  addBusiness() {
    if (businessNameController.text.isEmpty) {
      businessNameError.value = "Enter business name";
    } else if (dropDownValue.value == "Select") {
      dropDownError.value = "select a valid type";
    } else if (locationController.text.isEmpty) {
      locationError.value = "Enter location name";
    } else {
      Get.to(
        () => const AddBusinessSuccessful(),
        transition: Transition.rightToLeft,
      );
    }
  }

  onReturnHomeClicked(){
    Get.offAll(
          () => const Dashboard(),
      transition: Transition.rightToLeft,
    );
  }

  @override
  void onClose() {
    super.onClose();
    businessNameController.clear();
    locationController.clear();
    locationError.value = "";
    dropDownError.value = "";
    dropDownValue.value = "Select";
    businessNameError.value = "";
  }
}
