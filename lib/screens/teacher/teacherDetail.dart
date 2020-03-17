import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              "Simon Fraser University",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            Text("Business Major",
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

  Widget courses() => Container(
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
              Text('Subjects',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              SizedBox(height: 10.0),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: [
                        AreaBanner('academic', 'Math'),
                        SizedBox(width: 5.0),
                        Text('k8-k12', style: BodyBoldGreyText)
                      ]),
                      Text('\$125/hour',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: [
                        AreaBanner('mindset', 'Yoga'),
                        SizedBox(width: 5.0),
                        Text('beginner', style: BodyBoldGreyText)
                      ]),
                      Text('\$133/hour', style: BodyBoldText)
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: [
                        AreaBanner('arts', 'Painting'),
                        SizedBox(width: 5.0),
                        Text('intermediate-expert', style: BodyBoldGreyText)
                      ]),
                      Text('\$125/hour', style: BodyBoldText)
                    ],
                  )
                ],
              )
            ],
          )));

  Widget location() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Locations',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: ThemeColor,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(8.0))),
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Burnaby', style: BodyBoldText)),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: ThemeColor,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(8.0))),
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Richmond', style: BodyBoldText)),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: ThemeColor,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(8.0))),
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Vancouver', style: BodyBoldText)),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Able to teach online', style: BodyBoldGreyText)),
            SizedBox(height: 20.0),
            Divider(color: Colors.grey),
          ],
        ),
      );

  Widget introduction() => Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Introduction', style: BodyBoldText),
          SizedBox(height: 10.0),
          Text(
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy.).',
              style: TextStyle(fontSize: 14.0, color: Colors.grey)),
          SizedBox(height: 20.0),
          Divider(color: Colors.grey),
        ],
      ));

  Widget certificate() => Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Certificate', style: BodyBoldText),
        Placeholder(fallbackHeight: 200.0),
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
        Text('Schedual', style: BodyBoldText),
        Placeholder(fallbackHeight: 200.0),
        SizedBox(height: 20.0),
        Divider(color: Colors.grey),
      ]));
  @override
  Widget build(BuildContext context) {
    var teacher = Provider.of<Teacher>(context);
    return teacher == null
        ? LinearProgressIndicator()
        : Container(
            child: ListView(
            children: <Widget>[
              teacherIcon(teacher.icon),
              basicInfo(teacher),
              courses(),
              location(),
              introduction(),
              certificate(),
              review(),
              schedual(),
            ],
          ));
  }
}
