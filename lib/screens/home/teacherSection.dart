import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../style.dart';
import '../../components/teacher_list.dart';

class TeacherSection extends StatefulWidget {
  @override
  _TeacherSectionState createState() => _TeacherSectionState();
}

class _TeacherSectionState extends State<TeacherSection> {
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _teachers = [];

  bool _isLoading = true;

  _getTeachers() async {
    Query q = _firestore
        .collection('users')
        .where('type', isEqualTo: 'teacher')
        .orderBy('clicks')
        .limit(10);
    setState(() {
      _isLoading = true;
    });

    QuerySnapshot querySnapshot = await q.getDocuments();
    _teachers = querySnapshot.documents;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getTeachers();
  }

  Widget listTrailing = Container(
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
    return _isLoading == true
        ? Container(
            child: Center(
            child: Text('Loading...'),
          ))
        : Container(
            child: _teachers.length == 0
                ? Center(child: Text('No result'))
                : TeacherList(_teachers, listTrailing));
  }
}
