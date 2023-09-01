import 'package:get/get.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';
import 'package:haba_pay_main/screens/pin_login/components/pin_login.dart';
import 'package:haba_pay_main/screens/sign_up/components/sign_up.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

final SecureStorage _secureStorage = SecureStorage();
class LoadingController extends GetxController{
  @override
  Future<void> onInit() async {
    super.onInit();
    var accessToken = await _secureStorage.getAuthToken();
    var quickLogin = await _secureStorage.getQuickLogin();
    if(quickLogin == "true" && accessToken!.isNotEmpty){
      Get.offAll(() => const PinLogin(),
          transition: Transition.rightToLeft);
    } else if (accessToken!.isNotEmpty) {
      Get.offAll(
          const Dashboard(),
          transition: Transition.rightToLeft
      );
    }else{
        Get.offAll(() => const SignUp(),
            transition: Transition.rightToLeft);
    }
  }
}