import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task1/views/home_Screen.dart';
import 'package:task1/views/login_screen.dart';
import 'package:pinput/pinput.dart';
import 'login_screen.dart';

class OtpScreen extends StatelessWidget {
  var code = '';
  FirebaseAuth auth = FirebaseAuth.instance;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Spacer(),
        Pinput(
          length: 6,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          onChanged: (value) {
            code = value;
          },
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            try {
              AuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: LoginScreen.verify, smsCode: code);

              // Sign the user in (or link) with the credential
              await auth.signInWithCredential(credential);

              // Navigator.pushNamed(context, 'login')
              Get.to(HomeScreen());
            } catch (e) {
              print('Wrong OTP');
            }
          },
          child: Text("VERIFY"),
          color: Colors.blue,
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    ));
  }
}
