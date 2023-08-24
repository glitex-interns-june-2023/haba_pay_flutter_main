import 'package:get/get.dart';
import 'package:haba_pay_main/screens/pin_login/components/pin_login.dart';
import 'package:haba_pay_main/screens/sign_up/components/sign_up.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

final SecureStorage _secureStorage = SecureStorage();
class LoadingController extends GetxController{
  @override
  Future<void> onInit() async {
    super.onInit();
    var quickLogin = await _secureStorage.getQuickLogin();
    print("[[[[[[[[[[[[[[[[[[[[[[[[[[$quickLogin}");
    if(quickLogin == "true"){
      Get.to(() => const PinLogin(),
          transition: Transition.rightToLeft);
    } else {
      Get.to(() => const SignUp(),
          transition: Transition.rightToLeft);
    }
  }
}