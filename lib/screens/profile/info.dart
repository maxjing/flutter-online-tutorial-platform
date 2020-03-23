import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                'Basic Information',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Text(
                'TO START TEACHING',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'FILL IN THE FORM BELOW',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
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
              value: db.streamTeacher('pDBLYyP1v6S60EpRo6dOkivIUtx1'),
              child: InformationForm()),
        ],
      )),
    );
  }
}

class InformationForm extends StatefulWidget {
  // final String _teacherId;
  // InformationForm(this._teacherId);
  @override
  _InformationFormState createState() => _InformationFormState();
}

class _InformationFormState extends State<InformationForm> {
  final db = DatabaseService();

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final db = DatabaseService();
    var teacher = Provider.of<Teacher>(context);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_info_teacher.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
            padding: const EdgeInsets.all(25.0),
            child: FormBuilder(
              key: _fbKey,
              autovalidate: true,
              initialValue: {
                'firstName': teacher.firstName,
                'middleName': teacher.middleName,
                'lastName': teacher.lastName,
                'age': teacher.age.toString(),
                'gender': "Female",
                'occupation': "Student",
                'organization': teacher.organization,
                'areas': teacher.areas,
                'major': teacher.major,
                'highlight': teacher.highlight,
                'introduction': teacher.introduction,
              },
              readOnly: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'About me',
                        style: BodyBoldText,
                      )),
                  SizedBox(height: 10.0),
                  FormBuilderTextField(
                    attribute: "firstName",
                    decoration: InputDecoration(
                      labelText: "First Name",
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
                      labelText: "Middle Name",
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
                    attribute: "lastName",
                    decoration: InputDecoration(
                      labelText: "Last Name",
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
                      labelText: "age",
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
                    decoration: InputDecoration(
                      labelText: "Gender",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    // initialValue: 'Male',
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
                      labelText: "Cities you are able to teach",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    attribute: "areas",
                    options: [
                      FormBuilderFieldOption(value: 'Vancouver'),
                      FormBuilderFieldOption(value: 'Burnaby'),
                      FormBuilderFieldOption(value: 'Richmond'),
                    ],
                    onChanged: _onChanged,
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
                    maxLines: 2,
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
                  MaterialButton(
                    color: TextFieldBGColor,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      _fbKey.currentState.save();
                      if (_fbKey.currentState.validate()) {
                        db.createTeacher('pDBLYyP1v6S60EpRo6dOkivIUtx1',
                            _fbKey.currentState.value);
                        print(_fbKey.currentState.value.runtimeType);
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Submitting')));
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Please complete the form properly')));
                      }
                    },
                  ),
                  Container(
                      child: Center(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      color: TextFieldBGColor,
                      textColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      onPressed: () => {
                        _fbKey.currentState.reset()
                        // if (_formKey——.currentState.validate())
                        //   {
                        //     db.createTeacher(
                        //       'pDBLYyP1v6S60EpRo6dOkivIUtx1',
                        //       firstName.text,
                        //       middleName.text,
                        //       lastName.text,
                        //       int.parse(age.text),
                        //       occupation.text,
                        //       organization.text,
                        //       major.text,
                        //       highlight.text,
                        //       introduction.text,
                        //     ),
                        //     Scaffold.of(context).showSnackBar(
                        //         SnackBar(content: Text('Processing Data')))
                        //   }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  )),
                ],
              ),
            )));
  }
}
