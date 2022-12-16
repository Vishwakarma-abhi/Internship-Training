import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:task1/views/home_Screen.dart';
import 'package:task1/views/profile_checker.dart';
import 'package:task1/views/viewprofile.dart';
import 'package:get/get.dart';

class my_profile extends StatefulWidget {
  const my_profile({Key? key}) : super(key: key);

  @override
  State<my_profile> createState() => _my_profileState();
}

class _my_profileState extends State<my_profile> {
  bool isprofile = false;

  final fullname = TextEditingController();
  final studentID = TextEditingController();
  final semester = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();

  //Database reference varaible and functions
  late DatabaseReference dbRef;

  get math => null;
  Query dbQuery = FirebaseDatabase.instance.reference().child('Resume');
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('Resume');
  @override
  void initState() {
    super.initState();
    //creating Student Table in Firebase Realtime Database
    dbRef = FirebaseDatabase.instance.reference().child('Resume');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFAEDED),
        // body: isprofile
        //     ? checkprofile()
        body: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: Text(
                    'Create Profile',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                    controller: fullname,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Full Name',
                        hintText: 'Enter Your Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: TextField(
                    controller: studentID,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'StudentID',
                        hintText: 'Enter your Student ID'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: TextField(
                    controller: semester,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Semester',
                        hintText: 'Enter your Semester'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: TextField(
                    controller: state,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'State',
                        hintText: 'Enter your State'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: TextField(
                    controller: city,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'City',
                        hintText: 'Enter your City'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Map<String, String> students = {
                      'fullname': fullname.text,
                      'Student ID': studentID.text,
                      'Semester': semester.text,
                      'State': state.text,
                      'City': state.text,
                    };

                    if (isprofile) {
                      Get.snackbar('Profile Already Exist', 'View Profile');
                      Get.to(myprofile());
                    } else {
                      dbRef.push().set(students);
                      setState(() {
                        isprofile = true;
                      });
                      Get.snackbar('Profile Created', '');
                    }

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: ((context) => myprofile())));
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      'Create',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFBD59),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black)),
                  ),
                )
              ],
            ),
          ]),
        ));
  }
}
