import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/views/viewprofile.dart';

class checkprofile extends StatefulWidget {
  const checkprofile({Key? key}) : super(key: key);

  @override
  State<checkprofile> createState() => _checkprofileState();
}

class _checkprofileState extends State<checkprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Profile Already created'),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => myprofile()));
                // Get.to(my_profile());
              },
              child: Container(
                  width: 120,
                  height: 80,
                  color: Colors.amber,
                  child: Center(child: Text('Tap to view Profile'))),
            )
          ],
        ),
      ),
    );
  }
}
