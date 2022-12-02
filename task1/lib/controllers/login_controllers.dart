import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task1/views/home_Screen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;
  late String otp;

  var auth = FirebaseAuth.instance;

  verifyPhone(String phone) async {
    isLoading.value = true;
    await auth.verifyPhoneNumber(
        timeout: Duration(seconds: 50),
        phoneNumber: '91' + phone,
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          otp = authCredential.smsCode.toString();
          await auth.signInWithCredential(authCredential);
          if (auth.currentUser != null) {
            isLoading.value = false;
            authStatus.value = "login successfully";
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar("sms code info", "otp code hasn't been sent!!");
          }
        },
        codeSent: (String id, int? resendToken) {
          isLoading.value = false;
          String smsCode = 'xxxx';
          this.verId = id;
          AuthCredential credential = PhoneAuthProvider.credential(
              verificationId: id, smsCode: smsCode);
          authStatus.value = "login successfully";
        },
        codeAutoRetrievalTimeout: (String id) {
          this.verId = id;
        });
  }

  /////////
  otpVerify(String otp) async {
    isLoading.value = true;

    try {
      UserCredential userCredential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: this.verId, smsCode: otp));
      if (userCredential.user != null) {
        isLoading.value = false;
        Get.to(HomeScreen());
      }
    } on Exception catch (e) {
      Get.snackbar("otp info", "otp code is not correct !!");
    }
  }
}
