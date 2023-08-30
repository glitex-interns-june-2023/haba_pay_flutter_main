import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haba_pay_main/screens/dashboard/components/dashboard.dart';
import 'package:haba_pay_main/services/pin_secure_storage.dart';
import '../../../model/GoogleTokenModel.dart';
import '../../../model/UserModel.dart';
import '../../../services/base_client.dart';


class SignInController extends GetxController{
  final SecureStorage _secureStorage = SecureStorage();
  var isLoading = false.obs;
  final _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    isLoading(true);
    try {
      googleAccount.value = await _googleSignIn.signIn();
      var credential = await _googleSignIn.currentUser!.authentication.catchError((onError){
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown error occurred",
          duration: Duration(seconds: 3),
        ));
      });
      var response = await BaseClient.post("/v1/auth/google",
          GoogleTokenModel(token: credential.idToken))
          .catchError((onError) {
        Get.showSnackbar( const GetSnackBar(
          message: "Unknown error occurred",
          duration: Duration(seconds: 3),
        ));
      });

      var user = userModelFromJson(response);

      if (response != null) {
        if (user.success != false) {
          await _secureStorage.setEmail(user.data!.email);
          await _secureStorage.setUserName(user.data!.username);
          await _secureStorage.setFirstName(user.data!.firstName);
          await _secureStorage.setLastName(user.data!.lastName);
          await _secureStorage.setPhoneNumber(user.data!.phone);
          await _secureStorage.setAuthToken(user.data!.accessToken);
          await _secureStorage.setRefreshToken(user.data!.refreshToken);
          Get.offAll(
                () => const Dashboard(),
            transition: Transition.rightToLeft,
          );
        } else {
          Get.showSnackbar(GetSnackBar(
            message: user.message,
            duration: const Duration(seconds: 3),
          ));
        }
      } else {
        Get.showSnackbar(GetSnackBar(
          message: user.message,
          duration: const Duration(seconds: 3),
        ));
      }
    } finally {
      isLoading(false);
    }
  }
}