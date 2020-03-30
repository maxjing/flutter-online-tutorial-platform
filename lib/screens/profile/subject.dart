import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:developer';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class Subject extends StatefulWidget {
  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text("haha")));
  }
}
