import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';

import '../components/add_phone_number.dart';

class SignUpController extends GetxController{
  final SecureStorage _secureStorage = SecureStorage();
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  signUp() async {
    isLoading(true);
    try{
      googleAccount.value = await _googleSignIn.signIn();
      if(googleAccount.value == null){
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Unknown error occurred',
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        await _secureStorage.setClientId(googleAccount.value?.id ?? "no id");
        await _secureStorage.setUserName(googleAccount.value?.displayName ?? "no name");
        await _secureStorage.setEmail(googleAccount.value?.email ?? "no email");
        Get.to(()=>const AddPhoneNumber(), transition: Transition.rightToLeft);
      }
    } finally {
      isLoading(false);
    }
  }

  sendUserInfo() async{
    isLoading(true);
    try{
      //post data
      //get token and store it locally
    } finally{
      isLoading(false);
    }
  }
}