import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'area_banner.dart';

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
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: Image.network(widget.list[index].data['profileIcon']),
              title: Text(widget.list[index].data['firstName'] +
                  " " +
                  widget.list[index].data['lastName'] +
                  ' | ' +
                  widget.list[index].data['age'].toString()),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getAreaBanner(widget.list[index].data['areas']),
                    Text(widget.list[index].data['description'])
                  ]),
              trailing: widget.trail);
        });
  }
}
