import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../db.dart';
import '../style.dart';
import '../models/teacher.dart';
import '../routes.dart';
import 'area_banner.dart';
import 'dart:developer';

class TeacherCard extends StatefulWidget {
  final Teacher _teacher;
  final Container _trail;
  TeacherCard(this._teacher, this._trail);
  @override
  _TeacherCardState createState() => _TeacherCardState();
}

class _TeacherCardState extends State<TeacherCard> {
  final db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
      leading: Image.network(widget._teacher.icon),
      title: Text(widget._teacher.firstName +
          " " +
          widget._teacher.lastName +
          ' | ' +
          widget._teacher.age.toString()),
      subtitle: StreamProvider<List<Teach>>.value(
        value: db.streamTeachesByUserId(widget._teacher.id),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [TeachesBanners(), Text(widget._teacher.highlight)]),
      ),
      trailing: widget._trail,
      onTap: () => _onTeacherTap(context, widget._teacher.id),
    );
  }

  _onTeacherTap(BuildContext context, String teacherID) {
    Navigator.pushNamed(context, TeacherRoute, arguments: {'id': teacherID});
  }
}

class TeachesBanners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var teaches = Provider.of<List<Teach>>(context);

    return teaches == null
        ? LinearProgressIndicator()
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: teaches.map((teach) {
              return Container(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: AreaBanner(teach.category, teach.name));
            }).toList());
  }
}
