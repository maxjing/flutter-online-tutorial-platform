import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../style.dart';
import '../../db.dart';
import '../../models/teacher.dart';

class BackgroundForm extends StatefulWidget {
  @override
  _BackgroundFormState createState() => _BackgroundFormState();
  final String uid;
  BackgroundForm(this.uid);
}

class _BackgroundFormState extends State<BackgroundForm> {
  final db = DatabaseService();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  ValueChanged _onChanged = (val) => {};
  List<dynamic> _certificates = [];
  final _newCertificateController = TextEditingController();
  int _cLen = 0;

  var _newCertificates = List<Widget>();
  String errorMsg;
  bool showError = false;

  void _addCertificate() {
    setState(() => ++_cLen);
    if (_cLen > 1) {
      return;
    }

    _newCertificates = List.from(_newCertificates)
      ..add(
        Card(
          child: ListTile(
            title: TextField(
              controller: _newCertificateController,
            ),
            trailing: IconButton(
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () => {
                      _certificates.add(_newCertificateController.text),
                      Firestore.instance
                          .collection('teachers')
                          .document(widget.uid)
                          .updateData({'certificates': _certificates}),
                      _newCertificateController.clear()
                    }),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final db = DatabaseService();

    var teacher = Provider.of<Teacher>(context);
    log(teacher.registered.toString());
    //certificates is not empty
    if (teacher != null && teacher.certificates != []) {
      setState(() {
        _certificates = new List.from(teacher.certificates, growable: true);
      });
    }

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_info_teacher.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: teacher == null
                ? LinearProgressIndicator()
                : FormBuilder(
                    key: _fbKey,
                    autovalidate: true,
                    initialValue: {
                      'occupation': teacher.occupation ?? 'Working',
                      'organization': teacher.organization ?? '',
                      'major': teacher.major ?? '',
                      'certificates':
                          new List.from(teacher.certificates, growable: true)
                    },
                    readOnly: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              tr('info.backgroundSubtitle'),
                              style: BodyBoldText,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              color: Colors.white,
                              textColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () => {_fbKey.currentState.reset()},
                              child: Text(
                                tr('button.reset'),
                                style: TextStyle(fontSize: 13.0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        if (teacher.occupation != '') ...[
                          FormBuilderDropdown(
                            attribute: "occupation",
                            onChanged: _onChanged,
                            decoration: InputDecoration(
                              labelText: tr('info.occupation.label'),
                              labelStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: TextFieldBGColor,
                            ),
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.pattern(
                                  "(Freelancer|Working|Student)",
                                  errorText: "Please select occupation")
                            ],
                            items: [
                              tr('info.occupation.hint'),
                              'Freelancer',
                              'Working',
                              'Student'
                            ]
                                .map((occupation) => DropdownMenuItem(
                                      value: occupation,
                                      child: Text('$occupation'),
                                    ))
                                .toList(),
                          ),
                        ],
                        if (teacher.occupation == '') ...[
                          FormBuilderDropdown(
                            attribute: "occupation",
                            initialValue: tr('info.occupation.hint'),
                            decoration: InputDecoration(
                              labelText: tr('info.occupation.label'),
                              labelStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: TextFieldBGColor,
                            ),
                            onChanged: _onChanged,
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.pattern(
                                  "(Freelancer|Working|Student)",
                                  errorText: "Please select occupation")
                            ],
                            items: [
                              tr('info.occupation.hint'),
                              'Freelancer',
                              'Working',
                              'Student'
                            ]
                                .map((occupation) => DropdownMenuItem(
                                      value: occupation,
                                      child: Text('$occupation'),
                                    ))
                                .toList(),
                          ),
                        ],
                        SizedBox(height: 10.0),
                        FormBuilderTextField(
                          attribute: "organization",
                          decoration: InputDecoration(
                            labelText: tr('info.organization.hint1'),
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: TextFieldBGColor,
                          ),
                          onChanged: _onChanged,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.pattern(
                                '^(?! )[A-Za-z0-9 ]*(?<! )\$',
                                errorText:
                                    'Only letter, digit, and space between are allowed')
                          ],
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 10.0),
                        FormBuilderTextField(
                          attribute: "major",
                          decoration: InputDecoration(
                            labelText: tr('info.organization.hint2'),
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: TextFieldBGColor,
                          ),
                          onChanged: _onChanged,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.pattern(
                                '^(?! )[A-Za-z ]*(?<! )\$',
                                errorText:
                                    'Only letter, and space between are allowed')
                          ],
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              tr('info.certificates'),
                              style: BodyBoldText,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              color: Colors.white,
                              textColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              onPressed: _addCertificate,
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        if (_certificates.isNotEmpty) ...[
                          for (var c in teacher.certificates)
                            Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(c.toString()),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () => {
                                            _certificates.remove(c),
                                            db.updateCertificates(
                                                teacher.id, _certificates)
                                          }),
                                ],
                              ),
                            ),
                        ],
                        Column(
                          children: _newCertificates,
                        ),
                        SizedBox(height: 20),
                        Container(
                            child: Center(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            color: Colors.white,
                            textColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              tr('button.submit'),
                              style: TextStyle(fontSize: 13.0),
                            ),
                            onPressed: () {
                              _fbKey.currentState.save();
                              if (_fbKey.currentState.validate()) {
                                if (teacher.registered == false) {
                                  db.createTeacherBackground(
                                      widget.uid, _fbKey.currentState.value);
                                } else {
                                  db.updateTeacherBackground(
                                      widget.uid, _fbKey.currentState.value);
                                }

                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Submitting')));
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Please complete the form properly')));
                              }
                            },
                          ),
                        )),
                      ],
                    ),
                  )));
  }
}
