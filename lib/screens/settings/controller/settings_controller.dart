import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/screens/sign_up/components/sign_up.dart';


class SettingsController extends GetxController{
  var isMoreExpanded = false.obs;
  var isSendingEmail = false.obs;
  var isEmailSend = false.obs;
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  logout() async {
    isLoading(true);
    try{
      //googleAccount.value = await _googleSignIn.signOut();
      Get.offAll(()=> const SignUp(), transition: Transition.rightToLeft);
    } finally {
      isLoading(false);
    }
  }

  sendEmail(){
    isSendingEmail(true);
    try{
      isEmailSend(true);
    } finally {
      isSendingEmail(false);
    }
  }

  onIsMoreExpanded(){
    isMoreExpanded.value = !isMoreExpanded.value;
  }
}

