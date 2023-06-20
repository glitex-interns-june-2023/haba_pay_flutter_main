import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../components/add_phone_number.dart';

class SignUpController extends GetxController{
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
        Get.to(()=>const AddPhoneNumber(), transition: Transition.rightToLeft);
      }
    } finally {
      isLoading(false);
    }
  }
}