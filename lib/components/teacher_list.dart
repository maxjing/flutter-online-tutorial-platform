import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../routes.dart';
import '../style.dart';
import '../db.dart';
import '../models/teacher.dart';
import 'area_banner.dart';

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
        : Column(children: <Widget>[
            ListView.separated(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                    ),
                itemCount: teachers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                    leading: Image.network(teachers[index].icon),
                    title: Text(teachers[index].firstName +
                        " " +
                        teachers[index].lastName +
                        ' | ' +
                        teachers[index].age.toString()),
                    subtitle: StreamProvider<List<Teach>>.value(
                      value: db.streamTeachesByUserId(teachers[index].id),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TeachesBanners(),
                            Text(teachers[index].description)
                          ]),
                    ),
                    trailing: widget.trail,
                    onTap: () => _onTeacherTap(context, teachers[index].id),
                  );
                })
          ]);
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
