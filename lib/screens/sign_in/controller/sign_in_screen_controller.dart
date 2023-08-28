import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';


class SignInController extends GetxController{
  final SecureStorage _secureStorage = SecureStorage();
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    isLoading(true);
    try{
      googleAccount.value = await _googleSignIn.signIn();
      if(googleAccount.value?.email == null){
        //show toast error
      } else {
        // await _secureStorage.setClientId(googleAccount.value?.id ?? "no id");
        // var response = await BaseClient.post(
        //     "/google_token_validation",
        //     await _secureStorage.getClientId()
        // );
        // user(SignInEntity.fromJson(response));
        // await _secureStorage.setAuthToken(user.value.accessToken);
        Get.to(()=> const Dashboard(), transition: Transition.rightToLeft);
      }
    } finally {
      isLoading(false);
    }
  }
}

