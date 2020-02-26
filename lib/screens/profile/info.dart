import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../helper.dart';
import '../../style.dart';

class Info extends StatefulWidget {
  final FirebaseUser user;
  Info({this.user});
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final databaseReference = Firestore.instance;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final age = TextEditingController();
  final description = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    firstName.dispose();
    lastName.dispose();
    age.dispose();
    description.dispose();
    super.dispose();
  }

  final Widget header = Container(
      constraints: BoxConstraints.expand(
        height: getScreenHeight() * 0.2,
      ),
      decoration: BoxDecoration(color: TeacherLoginButtonColor),
      child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'Basic Information',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Text(
                'TO START TEACHING',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'FILL IN THE FORM BELOW',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )));

  // Widget occupation = Container(

  // )
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        header,
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_info_teacher.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Name
                  Container(alignment: Alignment.topLeft, child: Text('Name')),
                  Text(
                    widget.user != null ? "${widget.user.uid}" : "",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: firstName,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.71),
                      hintText: "FIRST",
                      hintStyle: TextStyle(
                          color: InfoTextfieldColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: lastName,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.71),
                      hintText: "LAST",
                      hintStyle: TextStyle(
                          color: InfoTextfieldColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.71),
                      hintText: "MIDDLE",
                      hintStyle: TextStyle(
                          color: InfoTextfieldColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.topLeft,
                    width: getScreenWidth() * 0.2,
                    child: TextField(
                      controller: age,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 0.71),
                        hintText: "AGE",
                        hintStyle: TextStyle(
                            color: InfoTextfieldColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold),
                      ),
                      style: TextStyle(
                        color: InfoTextfieldColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft, child: Text('Occupation')),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        color: Color.fromRGBO(255, 255, 255, 0.71),
                        textColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {},
                        child: Text(
                          "Student",
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        color: Color.fromRGBO(255, 255, 255, 0.71),
                        textColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "Working",
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        color: Color.fromRGBO(255, 255, 255, 0.71),
                        textColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {
                          /*...*/
                        },
                        child: Text(
                          "Freelancer",
                          style: TextStyle(fontSize: 13.0),
                        ),
                      )
                    ],
                  )),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Organization')),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.71),
                      hintText: "Name of the organization",
                      hintStyle: TextStyle(
                          color: InfoTextfieldColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text('Introduction')),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: description,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.71),
                      hintText: "Introduce yourself",
                      hintStyle: TextStyle(
                          color: InfoTextfieldColor,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                      child: Center(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      color: Color.fromRGBO(255, 255, 255, 0.71),
                      textColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        createUser();
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  )),
                ],
              ),
            )),
      ]),
    );
  }

  Map<String, dynamic> areasMap = {
    'Arts': ['Music', 'Movie'],
    'Academic': ['Math', 'Chinese']
  };
  void createUser() async {
    await databaseReference
        .collection("users")
        .document(widget.user.uid)
        .setData({
      'firstName': firstName.text,
      'lastName': lastName.text,
      'age': int.parse(age.text),
      'type': 'teacher',
      'profileIcon':
          'https://firebasestorage.googleapis.com/v0/b/airtnl-268322.appspot.com/o/profileIcon%2Fteacher_2.png?alt=media&token=89b9de7f-ed55-4967-8240-b917f0582a54',
      'areas': areasMap,
      'clicks': 1,
      'description': description.text
    });
  }
}
