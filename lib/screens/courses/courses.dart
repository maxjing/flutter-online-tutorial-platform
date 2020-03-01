import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../db.dart';
import '../../helper.dart';
import '../../models/category.dart';
import '../../components/searchbar.dart';

class Courses extends StatefulWidget {
  final String _categoryId;
  Courses(this._categoryId);
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: getAreaColor(widget._categoryId),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
                constraints: BoxConstraints.expand(
                  height: getScreenHeight() * 0.15,
                ),
                decoration:
                    BoxDecoration(color: getAreaColor(widget._categoryId)),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              widget._categoryId.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Searchbar()
                      ],
                    ))),
            Container(
                child: StreamProvider<List<Course>>.value(
              value: db.streamCoursesByCategory(widget._categoryId),
              child: CourseList(),
            ))
          ],
        ));
  }
}

class CourseList extends StatelessWidget {
  final db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    var courses = Provider.of<List<Course>>(context);
    return courses == null
        ? LinearProgressIndicator()
        : GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            children: courses.map((course) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Image.network(course.img, fit: BoxFit.cover),
                    SizedBox(height: 5.0),
                    Text(
                      course.name,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              );
            }).toList());
  }
}
