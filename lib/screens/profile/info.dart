import 'package:airtnl/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:provider/provider.dart';

import 'package:easy_localization/easy_localization.dart';
import '../../helper.dart';
import '../../style.dart';
import '../../db.dart';
import '../../models/teacher.dart';
import './personalForm.dart';
import './backgroundForm.dart';
import './tutorialForm.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    final db = DatabaseService();
    var user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TeacherLoginButtonColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, ProfileRoute),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
              constraints: BoxConstraints.expand(
                height: getScreenHeight() * 0.15,
              ),
              decoration: BoxDecoration(color: TeacherLoginButtonColor),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (_selected == 0) ...[
                        Text(
                          tr('info.title'),
                          style: TitleTextStyle,
                        ),
                      ],
                      if (_selected == 1) ...[
                        Text(
                          tr('info.backgroundTitle'),
                          style: TitleTextStyle,
                        ),
                      ],
                      if (_selected == 2) ...[
                        Text(
                          tr('info.tutorialTitle'),
                          style: TitleTextStyle,
                        ),
                      ],
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            color: _selected == 0
                                ? ButtonPressedBGColor
                                : Colors.white,
                            textColor:
                                _selected == 0 ? Colors.white : Colors.black,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () => setState(() => _selected = 0),
                            child: Text(
                              tr('button.personal'),
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            color: _selected == 1
                                ? ButtonPressedBGColor
                                : Colors.white,
                            textColor:
                                _selected == 1 ? Colors.white : Colors.black,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () => setState(() => _selected = 1),
                            child: Text(
                              tr('button.background'),
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            color: _selected == 2
                                ? ButtonPressedBGColor
                                : Colors.white,
                            textColor:
                                _selected == 2 ? Colors.white : Colors.black,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () => setState(() => _selected = 2),
                            child: Text(
                              tr('button.tutorial'),
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))),
          MultiProvider(
              providers: [
                StreamProvider<Teacher>.value(
                  value: db.streamTeacher(user.uid),
                  catchError: (_, err) => Teacher.initializer(),
                ),
                StreamProvider<List<Teach>>.value(
                  value: db.streamTeachesByUserId(user.uid),
                  catchError: (_, err) => [],
                ),
              ],
              child: Column(
                children: <Widget>[
                  if (_selected == 0) ...[
                    PersonalForm(user.uid, user.phoneNumber)
                  ],
                  if (_selected == 1) ...[BackgroundForm(user.uid)],
                  if (_selected == 2) ...[TutorialForm(user.uid)]
                ],
              )),
        ],
      )),
    );
  }
}
