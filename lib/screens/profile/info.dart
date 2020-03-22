import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../helper.dart';
import '../../style.dart';
import '../../db.dart';
import '../../models/teacher.dart';

class Info extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final db = DatabaseService();
    var user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      body: ListView(children: [
        header,
        StreamProvider<Teacher>.value(
            value: db.streamTeacher('pDBLYyP1v6S60EpRo6dOkivIUtx1'),
            child: InformationForm()),
      ]),
    );
  }
}

class InformationForm extends StatefulWidget {
  @override
  _InformationFormState createState() => _InformationFormState();
}

class _InformationFormState extends State<InformationForm> {
  final _formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final lastName = TextEditingController();
  final age = TextEditingController();

  // final String gender;
  final introduction = TextEditingController();
  final major = TextEditingController();
  final occupation = TextEditingController();
  final organization = TextEditingController();
  final highlight = TextEditingController();
  // final  teachOnline;
  // final String icon;
  // final int clicks;

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the
  //   // widget tree.
  //   firstName.dispose();
  //   lastName.dispose();
  //   age.dispose();
  //   description.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final db = DatabaseService();
    var teacher = Provider.of<Teacher>(context);
    bool hasInfo = teacher != null;
    if (hasInfo) {
      firstName.text = teacher.firstName;
      lastName.text = teacher.lastName;
      age.text = teacher.age.toString();
      middleName.text = teacher.middleName;
      introduction.text = teacher.introduction;
      major.text = teacher.major;
      occupation.text = teacher.occupation;
      highlight.text = teacher.highlight;
      organization.text = teacher.organization;
    }
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_info_teacher.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Name',
                        style: BodyBoldText,
                      )),
                  SizedBox(height: 10.0),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your first name';
                      }
                    },
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
                      fillColor: TextFieldBGColor,
                      hintText: "FIRST",
                      hintStyle: TextStyle(
                        color: InfoTextfieldColor,
                        fontSize: 13.0,
                      ),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
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
                      fillColor: TextFieldBGColor,
                      hintText: "LAST",
                      hintStyle: TextStyle(
                        color: InfoTextfieldColor,
                        fontSize: 13.0,
                      ),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: middleName,
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
                      fillColor: TextFieldBGColor,
                      hintText: "MIDDLE",
                      hintStyle: TextStyle(
                        color: InfoTextfieldColor,
                        fontSize: 13.0,
                      ),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.topLeft,
                    width: getScreenWidth() * 0.2,
                    child: TextFormField(
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
                        fillColor: TextFieldBGColor,
                        hintText: "AGE",
                        hintStyle: TextStyle(
                          color: InfoTextfieldColor,
                          fontSize: 13.0,
                        ),
                      ),
                      style: TextStyle(
                        color: InfoTextfieldColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Occupation',
                        style: BodyBoldText,
                      )),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        color: TextFieldBGColor,
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
                        color: TextFieldBGColor,
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
                        color: TextFieldBGColor,
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
                      child: Text(
                        'Organization',
                        style: BodyBoldText,
                      )),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: organization,
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
                      fillColor: TextFieldBGColor,
                      hintText: "Name of the organization",
                      hintStyle: TextStyle(
                        color: InfoTextfieldColor,
                        fontSize: 13.0,
                      ),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: major,
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
                      fillColor: TextFieldBGColor,
                      hintText: "Major(if applicable)",
                      hintStyle: TextStyle(
                        color: InfoTextfieldColor,
                        fontSize: 13.0,
                      ),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Highlight',
                        style: BodyBoldText,
                      )),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: highlight,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: TextFieldBGColor,
                      hintText: "Enter your short description here",
                      hintStyle: TextStyle(
                        color: InfoTextfieldColor,
                        fontSize: 13.0,
                      ),
                    ),
                    style: TextStyle(
                      color: InfoTextfieldColor,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Introduction',
                        style: BodyBoldText,
                      )),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: introduction,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: TextFieldBGColor,
                      hintText: "Introduce yourself",
                      hintStyle: TextStyle(
                        color: InfoTextfieldColor,
                        fontSize: 13.0,
                      ),
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
                      color: TextFieldBGColor,
                      textColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () => {
                        if (_formKey.currentState.validate())
                          {
                            db.createTeacher(
                              'pDBLYyP1v6S60EpRo6dOkivIUtx1',
                              firstName.text,
                              middleName.text,
                              lastName.text,
                              int.parse(age.text),
                              occupation.text,
                              organization.text,
                              major.text,
                              highlight.text,
                              introduction.text,
                            ),
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')))
                          }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  )),
                ],
              ),
            )));
  }
}
