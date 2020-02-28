import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../routes.dart';
import '../../style.dart';
import '../../db.dart';
import '../../helper.dart';
import '../../models/teacher.dart';

class TeacherDetail extends StatefulWidget {
  final String _teacherID;
  TeacherDetail(this._teacherID);
  @override
  _TeacherDetailState createState() => _TeacherDetailState();
}

class _TeacherDetailState extends State<TeacherDetail> {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamProvider<Teacher>.value(
      value: db.streamTeacher(widget._teacherID),
      child: TeacherDetailConten(),
    ));
  }
}

class TeacherDetailConten extends StatelessWidget {
  Widget iconSection(String imgUrl) => Container(
        height: getScreenWidth() * 0.3,
        width: getScreenWidth() * 0.3,
        child: Image.network(imgUrl),
      );

  @override
  Widget build(BuildContext context) {
    var teacher = Provider.of<Teacher>(context);
    return Stack(children: [
      Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(getScreenHeight() * 0.2),
              child: AppBar(
                backgroundColor: ThemeColor,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  Transform.rotate(
                    angle: -45 * 3.14 / 180,
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: null,
                    ),
                  ),
                ],
              )),
          body: Container(
              padding: EdgeInsets.only(top: getScreenHeight() * 0.1),
              child: ListView(
                children: <Widget>[
                  Container(
                      child: Center(
                    child: Text(
                      teacher.firstName +
                          " " +
                          teacher.lastName +
                          ' | ' +
                          teacher.age.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ))
                ],
              ))),
      Positioned(
          top: getScreenHeight() * 0.2 - getScreenWidth() * 0.04,
          left: getScreenWidth() / 2 - getScreenWidth() * 0.15,
          child: iconSection(teacher.icon)),
    ]);
  }
}
