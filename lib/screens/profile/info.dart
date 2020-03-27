import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../helper.dart';
import '../../style.dart';
import '../../db.dart';
import '../../models/teacher.dart';

class Info extends StatelessWidget {
  final Widget header = Container(
      constraints: BoxConstraints.expand(
        height: getScreenHeight() * 0.2,
      ),
      decoration: BoxDecoration(color: TeacherLoginButtonColor),
      child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tr('info.title'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Text(
                tr('info.subtitle'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              // Text(
              //   'FILL IN THE FORM BELOW',
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 14,
              //       fontWeight: FontWeight.w500),
              // ),
            ],
          )));

  @override
  Widget build(BuildContext context) {
    final db = DatabaseService();
    var user = Provider.of<FirebaseUser>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TeacherLoginButtonColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          header,
          StreamProvider<Teacher>.value(
              value: db.streamTeacher(user.uid),
              child: InformationForm(user.uid)),
        ],
      )),
    );
  }
}

class InformationForm extends StatefulWidget {
  @override
  _InformationFormState createState() => _InformationFormState();
  final String uid;
  InformationForm(this.uid);
}

class _InformationFormState extends State<InformationForm> {
  final db = DatabaseService();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  ValueChanged _onChanged = (val) => {};
  List<dynamic> _certificates = [];
  final _newCertificateController = TextEditingController();
  int _cLen = 0;

  var _newCertificates = List<Widget>();
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
    bool hasInfo = teacher != null;

    //certificates is not empty
    if (hasInfo && teacher.certificates != []) {
      setState(() {
        _certificates = new List.from(teacher.certificates, growable: true);
      });
    }

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_info_teacher.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            padding: const EdgeInsets.all(25.0),
            child: FormBuilder(
              key: _fbKey,
              autovalidate: true,
              initialValue: {
                'firstName': hasInfo ? teacher.firstName : "",
                'middleName': hasInfo ? teacher.middleName : "",
                'lastName': hasInfo ? teacher.lastName : "",
                'age': hasInfo ? teacher.age.toString() : "",
                'gender': hasInfo ? teacher.gender : "",
                'occupation': hasInfo ? teacher.occupation : "",
                'organization': hasInfo ? teacher.organization : "",
                'areas':
                    hasInfo ? new List.from(teacher.areas, growable: true) : [],
                'teachOnline': hasInfo ? teacher.teachOnline : false,
                'major': hasInfo ? teacher.major : "",
                'highlight': hasInfo ? teacher.highlight : "",
                'introduction': hasInfo ? teacher.introduction : "",
                'certificates': hasInfo && teacher.certificates != []
                    ? new List.from(teacher.certificates, growable: true)
                    : [],
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
                        tr('info.about_me'),
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
                  FormBuilderTextField(
                    attribute: "firstName",
                    decoration: InputDecoration(
                      labelText: tr('info.firstName'),
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: TextFieldBGColor,
                    ),
                    onChanged: _onChanged,
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10.0),
                  FormBuilderTextField(
                    attribute: "middleName",
                    decoration: InputDecoration(
                      labelText: tr('info.middleName'),
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: TextFieldBGColor,
                    ),
                    onChanged: _onChanged,
                    validators: [
                      // FormBuilderValidators.required(),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10.0),
                  FormBuilderTextField(
                    attribute: "lastName",
                    decoration: InputDecoration(
                      labelText: tr('info.lastName'),
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: TextFieldBGColor,
                    ),
                    onChanged: _onChanged,
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10.0),
                  FormBuilderTextField(
                    attribute: "age",
                    decoration: InputDecoration(
                      labelText: tr('info.age'),
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: TextFieldBGColor,
                    ),
                    onChanged: _onChanged,
                    valueTransformer: (text) => num.tryParse(text),
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(90),
                      FormBuilderValidators.min(1)
                    ],
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10.0),
                  FormBuilderDropdown(
                    attribute: "gender",
                    initialValue: 'Male',
                    decoration: InputDecoration(
                      labelText: "Gender",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: _onChanged,
                    hint: Text(
                      'Select Gender',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    validators: [FormBuilderValidators.required()],
                    items: ['Male', 'Female', 'Other']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text('$gender'),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Occupation',
                        style: BodyBoldText,
                      )),
                  FormBuilderDropdown(
                    attribute: "occupation",
                    initialValue: 'Working',
                    decoration: InputDecoration(
                      labelText: "Occupation",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    // initialValue: 'Male',
                    onChanged: _onChanged,
                    hint: Text(
                      'Select Occupation',
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    validators: [FormBuilderValidators.required()],
                    items: ['Freelancer', 'Working', 'Student']
                        .map((occupation) => DropdownMenuItem(
                              value: occupation,
                              child: Text('$occupation'),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Organization',
                        style: BodyBoldText,
                      )),
                  SizedBox(height: 10.0),
                  FormBuilderTextField(
                    attribute: "organization",
                    decoration: InputDecoration(
                      labelText: "Organization Name",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: TextFieldBGColor,
                    ),
                    onChanged: _onChanged,
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10.0),
                  FormBuilderTextField(
                    attribute: "major",
                    decoration: InputDecoration(
                      labelText: "Major (if applicable)",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: TextFieldBGColor,
                    ),
                    onChanged: _onChanged,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Areas',
                        style: BodyBoldText,
                      )),
                  SizedBox(height: 10.0),
                  FormBuilderCheckboxList(
                    decoration: InputDecoration(
                      labelText: "Locations that you are able to teach",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    attribute: "areas",
                    options: [
                      FormBuilderFieldOption(value: 'Vancouver'),
                      FormBuilderFieldOption(value: 'Burnaby'),
                      FormBuilderFieldOption(value: 'Richmond'),
                    ],
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    onChanged: _onChanged,
                  ),
                  FormBuilderCheckbox(
                    attribute: 'teachOnline',
                    onChanged: _onChanged,
                    leadingInput: true,
                    label: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Able to teach online? ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Highlight',
                        style: BodyBoldText,
                      )),
                  SizedBox(height: 10.0),
                  FormBuilderTextField(
                    attribute: "highlight",
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Enter your short description here",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: TextFieldBGColor,
                    ),
                    onChanged: _onChanged,
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 20.0),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Introduction',
                        style: BodyBoldText,
                      )),
                  SizedBox(height: 10.0),
                  FormBuilderTextField(
                    attribute: "introduction",
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: "Enter your introduction here",
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: TextFieldBGColor,
                    ),
                    onChanged: _onChanged,
                    validators: [
                      FormBuilderValidators.required(),
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  // SizedBox(height: 10),
                  // FlatButton(
                  //   child: Text('Add another'),
                  //   onPressed: _addCertificate,
                  // ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Certificates',
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
                  // Column(
                  //   children: <Widget>[
                  //     if (_fbKey
                  //         .currentState.value['certificates'].isEmpty) ...[
                  //       SizedBox(height: 100),
                  //     ],
                  //   ],
                  // ),
                  if (_certificates != []) ...[
                    for (var c in teacher.certificates)
                      Card(
                        child: ListTile(
                          title: Text(c.toString()),
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                              ),
                              onPressed: () => {
                                    _certificates.remove(c),
                                    Firestore.instance
                                        .collection('teachers')
                                        .document(teacher.id)
                                        .updateData(
                                            {'certificates': _certificates})
                                  }),
                        ),
                      ),
                  ],

                  Column(
                    children: _newCertificates,
                  ),

                  SizedBox(height: 10),
                  Container(
                      child: Center(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      color: Colors.white,
                      textColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 13.0),
                      ),
                      onPressed: () {
                        _fbKey.currentState.save();
                        if (_fbKey.currentState.validate()) {
                          // log(_fbKey.currentState.value['certificates']
                          //     .toString());
                          db.createTeacher(
                              widget.uid, _fbKey.currentState.value);

                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Submitting')));
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Please complete the form properly')));
                        }
                      },
                    ),
                  )),
                ],
              ),
            )));
  }
}
