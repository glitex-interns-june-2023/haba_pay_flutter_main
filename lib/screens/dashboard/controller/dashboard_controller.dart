import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/screens/sign_up/components/sign_up.dart';

class BottomNavBarController extends GetxController{
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  var tabIndex = 0.obs;

  void changeTabIndex(int index){
    tabIndex.value = index;
  }

  logout() async {
    isLoading(true);
    try{
      googleAccount.value = await _googleSignIn.signOut();
      Get.offAll(()=> const SignUp(), transition: Transition.leftToRight);
    } finally {
      isLoading(false);
    }
  }
}