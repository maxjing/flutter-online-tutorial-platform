import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
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
                ),
                body: TeacherDetailConten())));
  }
}

class TeacherDetailConten extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var teacher = Provider.of<Teacher>(context);
    return Container(
        child: ListView(
      children: <Widget>[
        Stack(children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(
              height: getScreenHeight() * 0.1,
            ),
            decoration: BoxDecoration(color: ThemeColor),
          ),
          Container(
              alignment: Alignment.topCenter,
              child: Container(
                height: getScreenWidth() * 0.3,
                width: getScreenWidth() * 0.3,
                child: Image.network(teacher.icon),
              ))
        ]),
        Container(
            child: Center(
          child: Text(
            teacher.firstName +
                " " +
                teacher.lastName +
                ' | ' +
                teacher.age.toString(),
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ))
      ],
    ));
  }
}
