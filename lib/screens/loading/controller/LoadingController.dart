import 'package:get/get.dart';
import 'package:haba_pay_main/screens/pin_login/components/pin_login.dart';
import 'package:haba_pay_main/screens/sign_up/components/sign_up.dart';
import '../../../services/pin_secure_storage.dart';

final SecureStorage _secureStorage = SecureStorage();

class LoadingController extends GetxController{
  var loading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    loading.value = true;
    try{
      var loginWithPin = false;
      var quickLogin = await _secureStorage.getQuickLogin();
      quickLogin == "true" ? true : false;
      if(loginWithPin == true){
        Get.to(() => const PinLogin(),
            transition: Transition.rightToLeft);
      } else {
        Get.to(() => const SignUp(),
            transition: Transition.rightToLeft);
      }
    } finally {
      loading.value = false;
    }
  }
}