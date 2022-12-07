import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/views/home_Screen.dart';

import 'package:task1/views/otp_Screen.dart';

class LoginScreen extends StatelessWidget {
  var phone = "";
  static String verify = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Login Screen'),
      ),
      body: Column(
        children: [
          Form(
              child: Column(
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    phone = value;
                  },
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
              )),
              Container(
                  margin: EdgeInsets.only(top: 40, bottom: 5),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // await FirebaseAuth.instance.verifyPhoneNumber(
                          //   phoneNumber: '+91' + phone,
                          //   verificationCompleted:
                          //       (PhoneAuthCredential credential) {},
                          //   verificationFailed: (FirebaseAuthException e) {},
                          //   codeSent:
                          //       (String verificationId, int? resendToken) {
                          //     LoginScreen.verify = verificationId;

                          //     Get.to(OtpScreen());
                          //   },
                          //   codeAutoRetrievalTimeout:
                          //       (String verificationId) {},
                          // );
                          Get.to(HomeScreen());
                        },
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 15.0,
                            ),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: Text(
                                  "Sign In",
                                  textAlign: TextAlign.center,
                                )),
                              ],
                            )),
                      ))),
            ],
          ))
        ],
      ),
    );
  }
}
