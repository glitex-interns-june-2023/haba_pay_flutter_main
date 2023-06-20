import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';


class SignInController extends GetxController{
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    isLoading(true);
    try{
      googleAccount.value = await _googleSignIn.signIn();
      if(googleAccount.value == null){
        //show toast error
      } else {
        //check the client id
        Get.to(()=> const Dashboard(), transition: Transition.rightToLeft);
      }
    } finally {
      isLoading(false);
    }
  }
}

