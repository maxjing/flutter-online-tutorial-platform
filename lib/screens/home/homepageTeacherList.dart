import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../style.dart';
import '../../db.dart';
import '../../models/teacher.dart';
import '../../components/teacher_list.dart';

class HomepageTeacherList extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final db = DatabaseService();

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
    return Container(
        child: StreamProvider<List<Teacher>>.value(
      value: db.streamTeachers(),
      child: TeachersList(listTrailing),
    ));
  }
}
