import 'package:airtnl/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../db.dart';
import '../../helper.dart';
import '../../models/category.dart';
import '../../components/searchbar.dart';
import '../../style.dart';
import '../../components/teacherCard.dart';
import '../../components/teacher_list.dart';
import '../../models/teacher.dart';

import 'dart:developer';

class CourseTeacherList extends StatefulWidget {
  final String _category;
  final String _courseId;

  CourseTeacherList(this._category, this._courseId);
  @override
  _CourseTeacherListState createState() => _CourseTeacherListState();
}

class _CourseTeacherListState extends State<CourseTeacherList> {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget._courseId,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          backgroundColor: getAreaColor(widget._category),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                constraints: BoxConstraints.expand(
                  height: getScreenHeight() * 0.12,
                ),
                decoration:
                    BoxDecoration(color: getAreaColor(widget._category)),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Searchbar(tr('searchbar.hint2')))),
            Container(
                child: StreamProvider<List<Teachers>>.value(
              value:
                  db.streamTeachersByCourse(widget._category, widget._courseId),
              child: TeacherListByCourse(),
            ))
          ],
        ));
  }
}

class TeacherListByCourse extends StatefulWidget {
  @override
  _TeacherListByCourseState createState() => _TeacherListByCourseState();
}

class _TeacherListByCourseState extends State<TeacherListByCourse> {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    var teachers = Provider.of<List<Teachers>>(context);
    List<String> teacherIds = [];
    if (teachers != null) {
      for (Teachers teacher in teachers) {
        teacherIds.add(teacher.teacherId);
      }
    }

    return teacherIds == []
        ? LinearProgressIndicator()
        : Container(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: teacherIds.map((teacherId) {
                  return Container(
                      child: StreamProvider<Teacher>.value(
                    value: db.streamTeacher(teacherId),
                    child: TeacherListDetail(),
                  ));
                }).toList()));
  }
}

class TeacherListDetail extends StatefulWidget {
  final db = DatabaseService();
  @override
  _TeacherListDetailState createState() => _TeacherListDetailState();
}

class _TeacherListDetailState extends State<TeacherListDetail> {
  final Widget listTrailing = Container(
      child: Row(mainAxisSize: MainAxisSize.min, children: [
    Transform.rotate(
      angle: -45 * 3.14 / 180,
      child: IconButton(
        icon: Icon(
          Icons.send,
          color: ThemeLightColor,
        ),
        onPressed: null,
      ),
    ),
    Icon(
      Icons.favorite_border,
      color: ThemeLightColor,
      semanticLabel: 'like',
    ),
  ]));
  @override
  Widget build(BuildContext context) {
    var teacher = Provider.of<Teacher>(context);
    return teacher == null
        ? LinearProgressIndicator()
        : TeacherCard(teacher, listTrailing);
  }
}
