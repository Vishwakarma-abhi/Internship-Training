import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/views/cv_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task1/views/login_screen.dart';

// import 'profile_view.dart';

class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Get.to(my_profile());
              },
              child: Icon(
                Icons.person_add_alt,
                size: 50,
              ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await auth.signOut();
          if (auth.currentUser == null) {
            Get.to(LoginScreen());
          }
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
