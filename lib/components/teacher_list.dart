import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../routes.dart';
import '../style.dart';
import '../db.dart';
import '../models/teacher.dart';
import 'area_banner.dart';
import 'teacherCard.dart';
import 'dart:developer';

class TeachersList extends StatefulWidget {
  final Container trail;
  TeachersList(this.trail);

  @override
  _TeachersListState createState() => _TeachersListState();
}

class _TeachersListState extends State<TeachersList> {
  final db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    var teachers = Provider.of<List<Teacher>>(context);

    return teachers == null
        ? LinearProgressIndicator()
        : ListView.separated(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                ),
            itemCount: teachers.length,
            itemBuilder: (BuildContext context, int index) {
              return TeacherCard(teachers[index], widget.trail);
            });
  }
}
