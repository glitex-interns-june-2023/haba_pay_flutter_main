import 'package:get/get.dart';

class UpdatesController extends GetxController{
  var isChecked = false.obs;
  onChanged(bool check){
    isChecked(check);
  }
}