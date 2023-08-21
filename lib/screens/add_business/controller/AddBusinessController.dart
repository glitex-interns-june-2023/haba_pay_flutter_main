import 'package:get/get.dart';

class AddBusinessController extends GetxController{
  var dropDownValue = "Select".obs;

  var items = [
    "Select",
    "item1",
    "item2"
  ].obs;

  onChanged(String value){
    dropDownValue.value = value;
  }
}