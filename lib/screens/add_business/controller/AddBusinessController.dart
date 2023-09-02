import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

import '../../../services/base_client.dart';
import '../../dashboard/components/dashboard.dart';
import '../components/add_business_successful.dart';

class AddBusinessController extends GetxController {
  final SecureStorage _secureStorage = SecureStorage();
  var businessNameError = "".obs;
  var locationError = "".obs;
  var dropDownError = "".obs;
  var isLoading = false.obs;
  var businessNameController = TextEditingController();
  var locationController = TextEditingController();
  var dropDownValue = "Select".obs;

  var items = ["Select", "item1", "item2"].obs;

  onChanged(String value) {
    dropDownValue.value = value;
  }

  addBusiness() async {
    if (businessNameController.text.isEmpty) {
      businessNameError.value = "Enter business name";
    } else if (dropDownValue.value == "Select") {
      dropDownError.value = "select a valid type";
    } else if (locationController.text.isEmpty) {
      locationError.value = "Enter location name";
    } else {
      isLoading(true);
      try {
        var data = {
          'name': businessNameController.text,
          'category': dropDownValue.value,
          'location': locationController.text
        };
        var response = await BaseClient.post("$updateBusinessDetailsUrl${await _secureStorage.getUserId()}/business", data);
        print(response);
        var success = json.decode(response);
        if (success['success'] == true) {
          Get.to(
            () => const AddBusinessSuccessful(),
            transition: Transition.rightToLeft,
          );
        } else {
          Get.showSnackbar(GetSnackBar(
            message: success['message'],
            duration: const Duration(seconds: 3),
          ));
        }
      } finally {
        isLoading(false);
      }
    }
  }

  onReturnHomeClicked() {
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
