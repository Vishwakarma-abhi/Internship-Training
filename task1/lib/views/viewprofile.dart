import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class myprofile extends StatefulWidget {
  const myprofile({Key? key}) : super(key: key);

  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
  Query dbQuery = FirebaseDatabase.instance.reference().child('Resume');
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('Resume');

  Widget listItem({required Map student}) {
    return Stack(
      children: [
        SizedBox(),
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                    width: 350,
                    height: 420,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(35)),
                          child: Center(
                              child: Text(
                            "" + student['fullname'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(35)),
                          child: Center(
                              child: Text(
                            "" + student['Student ID'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(35)),
                          child: Center(
                              child: Text(
                            "Semester - " + student['Semester'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(35)),
                          child: Center(
                              child: Text(
                            "" + student['State'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(35)),
                          child: Center(
                              child: Text(
                            "" + student['City'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 94, 140, 240),
                borderRadius: BorderRadius.circular(15)),
            width: 250,
            height: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'MY PROFILE',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              child: FirebaseAnimatedList(
                  query: dbQuery,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Map profiledata = snapshot.value as Map;
                    profiledata['key'] = snapshot.key;

                    return listItem(student: profiledata);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
