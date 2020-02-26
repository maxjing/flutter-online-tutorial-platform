import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'area_banner.dart';
import '../routes.dart';

class TeacherList extends StatefulWidget {
  final List<DocumentSnapshot> list;
  final Container trail;
  TeacherList(this.list, this.trail);

  @override
  _TeacherListState createState() => _TeacherListState();
}

class _TeacherListState extends State<TeacherList> {
  Widget getAreaBanner(Map<dynamic, dynamic> map) {
    return Row(
        children: map.entries
            .map((item) => Container(
                padding: const EdgeInsets.only(right: 5.0),
                child: AreaBanner(item.key, item.value.toList()[0])))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
            leading: Image.network(widget.list[index].data['profileIcon']),
            title: Text(widget.list[index].data['firstName'] +
                " " +
                widget.list[index].data['lastName'] +
                ' | ' +
                widget.list[index].data['age'].toString()),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              getAreaBanner(widget.list[index].data['areas']),
              Text(widget.list[index].data['description'])
            ]),
            trailing: widget.trail,
            onTap: () => _onTeacherTap(context, widget.list[index].documentID),
          );
        });
  }

  _onTeacherTap(BuildContext context, String teacherID) {
    Navigator.pushNamed(context, TeacherRoute, arguments: {'id': teacherID});
  }
}
