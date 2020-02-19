import 'package:airtnl/helper.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../style.dart';

class Teacher extends StatefulWidget {
  final String _teacherID;

  Teacher(this._teacherID);
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  Firestore _firestore = Firestore.instance;

  bool _isLoading = true;
  DocumentSnapshot _teacher;
  _getTeacher() async {
    setState(() {
      _isLoading = true;
    });
    _teacher =
        await _firestore.collection('users').document(widget._teacherID).get();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getTeacher();
  }

  Widget loading = Scaffold(
    body: Container(
      child: Center(child: Text('loading...')),
    ),
  );

  Widget titleSection(BuildContext context) => Scaffold(
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
            children: <Widget>[teacherInfoSection(_teacher)],
          )));

  Widget profileIconSection(String imgUrl) => Container(
        height: getScreenWidth() * 0.3,
        width: getScreenWidth() * 0.3,
        child: Image.network(imgUrl),
      );

  Widget teacherInfoSection(DocumentSnapshot _teacher) => Container(
          child: Center(
        child: Text(
          _teacher.data['firstName'] +
              " " +
              _teacher.data['lastName'] +
              ' | ' +
              _teacher.data['age'].toString(),
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _isLoading
          ? loading
          : Stack(
              children: [
                titleSection(context),
                Positioned(
                    top: getScreenHeight() * 0.2 - getScreenWidth() * 0.04,
                    left: getScreenWidth() / 2 - getScreenWidth() * 0.15,
                    child: profileIconSection(_teacher.data['profileIcon'])),
              ],
            ),
    );
  }
}
