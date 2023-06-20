import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';
import 'package:haba_pay_main/screens/sign_up/components/sign_up.dart';


class SettingsController extends GetxController{
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  logout() async {
    isLoading(true);
    try{
      googleAccount.value = await _googleSignIn.signOut();
      Get.offAll(()=> const SignUp(), transition: Transition.rightToLeft);
    } finally {
      isLoading(false);
    }
  }
}

