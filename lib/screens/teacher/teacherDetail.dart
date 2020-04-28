import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:developer';
import '../../style.dart';
import '../../db.dart';
import '../../helper.dart';
import '../../models/teacher.dart';
import '../../components/area_banner.dart';

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
    return MultiProvider(
        providers: [
          StreamProvider<Teacher>.value(
              value: db.streamTeacher(widget._teacherID)),
          StreamProvider<List<Teach>>.value(
              value: db.streamTeachesByUserId(widget._teacherID)),
        ],
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
            body: TeacherDetailConten()));
  }
}

class TeacherDetailConten extends StatelessWidget {
  Widget teacherIcon(icon) => Stack(children: <Widget>[
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
              child: Image.network(icon),
            ))
      ]);

  Widget basicInfo(Teacher teacher) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              teacher.firstName +
                  " " +
                  teacher.lastName +
                  ' | ' +
                  teacher.age.toString(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            SizedBox(height: 10.0),
            Text(
              teacher.organization,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            Text(teacher.major ?? "",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18)),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  color: ThemeColor,
                ),
                SizedBox(width: 50),
                Icon(
                  Icons.remove_red_eye,
                  color: ThemeColor,
                ),
                SizedBox(width: 2),
                Text("2336", style: TextStyle(color: ThemeColor))
              ],
            ),
          ],
        ),
      );

  Widget courses(List<Teach> teaches) => Container(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: ThemeColor,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(10.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(tr('info.subjects'), style: BodyBoldNormalText),
              SizedBox(height: 10.0),
              Column(
                  children: teaches.map((course) {
                return Container(
                    child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            AreaBanner(course.category, course.name),
                            SizedBox(width: 5.0),
                            Text(course.description, style: BodyBoldGreyText),
                          ],
                        ),
                        Text('\$' + course.hourlyRate.toString() + '/hour',
                            style: BodyBoldNormalText)
                      ],
                    ),
                    SizedBox(height: 10.0),
                  ],
                ));
              }).toList())
            ],
          )));

  Widget location(List<dynamic> areas, bool teachOnline) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(tr('info.areas.label'), style: BodyBoldText),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: areas.map((area) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: ThemeColor,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(8.0))),
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(area, style: BodyBoldNormalText)),
                );
              }).toList(),
            ),
            SizedBox(height: 10.0),
            if (teachOnline) ...[
              Container(
                  child: Text(tr('info.teachOnline'), style: BodyBoldGreyText)),
              SizedBox(height: 20.0),
            ],
            Divider(color: Colors.grey),
          ],
        ),
      );

  Widget introduction(String introduction) => Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(tr('info.introduction.label'), style: BodyBoldText),
          SizedBox(height: 10.0),
          Text(introduction,
              style: TextStyle(fontSize: 14.0, color: Colors.grey)),
          SizedBox(height: 20.0),
          Divider(color: Colors.grey),
        ],
      ));

  Widget certificates(List<dynamic> certificates) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(tr('info.certificates'), style: BodyBoldText),
        SizedBox(height: 10.0),
        if (certificates.isNotEmpty) ...[
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: certificates.map((c) {
              return Card(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        c.toString(),
                      )));
            }).toList(),
          ),
        ],
        SizedBox(height: 20.0),
        Divider(color: Colors.grey),
      ]));
  Widget review() => Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Reviews', style: BodyBoldText),
        Placeholder(fallbackHeight: 200.0),
        SizedBox(height: 20.0),
        Divider(color: Colors.grey),
      ]));
  Widget schedual() => Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(tr('info.schedule'), style: BodyBoldText),
        Placeholder(fallbackHeight: 200.0),
        SizedBox(height: 20.0),
        Divider(color: Colors.grey),
      ]));
  @override
  Widget build(BuildContext context) {
    var teacher = Provider.of<Teacher>(context);
    var teaches = Provider.of<List<Teach>>(context);
    return teacher == null
        ? LinearProgressIndicator()
        : Container(
            child: ListView(
            children: <Widget>[
              teacherIcon(teacher.icon),
              basicInfo(teacher),
              courses(teaches),
              location(teacher.areas, teacher.teachOnline),
              introduction(teacher.introduction),
              certificates(teacher.certificates),
              review(),
              schedual(),
            ],
          ));
  }
}
