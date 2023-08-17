import 'package:get/get.dart';

class UpdatesController extends GetxController{
  var isChecked = false.obs;
  var isLoading = false.obs;
  var isUpdateAvailable = false.obs;

  onChanged(bool check){
    isChecked(check);
  }

  checkingUpdates(){
    isLoading(true);
    try{
      isUpdateAvailable(true);
    } finally {
      isLoading(false);
    }
  }
}