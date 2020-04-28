import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../style.dart';
import '../../db.dart';
import '../../models/teacher.dart';

class PersonalForm extends StatefulWidget {
  @override
  _PersonalFormState createState() => _PersonalFormState();
  final String uid;
  final String phoneNumber;
  PersonalForm(this.uid, this.phoneNumber);
}

class _PersonalFormState extends State<PersonalForm> {
  final db = DatabaseService();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  ValueChanged _onChanged = (val) => {};

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
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: teacher == null
                ? LinearProgressIndicator()
                : FormBuilder(
                    key: _fbKey,
                    autovalidate: true,
                    initialValue: {
                      'firstName': teacher.firstName,
                      'middleName': teacher.middleName,
                      'lastName': teacher.lastName,
                      'age': teacher.age == 0 ? '' : teacher.age.toString(),
                      'gender': teacher.gender ?? 'Select Gender',
                      'phoneNumber': widget.phoneNumber,
                      'email': teacher.email,
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
                            FlatButton(
                                onPressed: () => {_fbKey.currentState.reset()},
                                child: Row(children: [
                                  Text(
                                    tr('button.reset'),
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                  Icon(
                                    Icons.refresh,
                                  ),
                                ])),
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
                            FormBuilderValidators.pattern('^[a-zA-Z]+\$',
                                errorText: "Only letter is allowed"),
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
                            FormBuilderValidators.pattern('^[a-zA-Z]+\$',
                                errorText: "Only letter is allowed"),
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
                            FormBuilderValidators.pattern('^[a-zA-Z]+\$',
                                errorText: "Only letter is allowed"),
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
                        if (teacher.gender != '') ...[
                          FormBuilderDropdown(
                            attribute: "gender",
                            decoration: InputDecoration(
                              labelText: tr('info.gender.label'),
                              labelStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: TextFieldBGColor,
                            ),
                            onChanged: _onChanged,
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.pattern(
                                  "(Male|Female|Other)",
                                  errorText: "Please select gender")
                            ],
                            items: [
                              tr('info.gender.hint'),
                              'Male',
                              'Female',
                              'Other'
                            ]
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text('$gender'),
                                    ))
                                .toList(),
                          ),
                        ],
                        if (teacher.gender == '') ...[
                          FormBuilderDropdown(
                            attribute: "gender",
                            initialValue: tr('info.gender.hint'),
                            decoration: InputDecoration(
                              labelText: tr('info.gender.label'),
                              labelStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: TextFieldBGColor,
                            ),
                            onChanged: _onChanged,
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.pattern(
                                  "(Male|Female|Other)",
                                  errorText: "Please select gender")
                            ],
                            items: [
                              tr('info.gender.hint'),
                              'Male',
                              'Female',
                              'Other'
                            ]
                                .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Text('$gender'),
                                    ))
                                .toList(),
                          ),
                        ],
                        SizedBox(height: 10.0),
                        FormBuilderTextField(
                          attribute: "phoneNumber",
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: tr('info.phoneNumber'),
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.black12,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        FormBuilderTextField(
                          attribute: "email",
                          decoration: InputDecoration(
                            labelText: tr('info.email'),
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: TextFieldBGColor,
                          ),
                          onChanged: _onChanged,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ],
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20.0),
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
                                  db.createTeacher(
                                      widget.uid, _fbKey.currentState.value);
                                } else {
                                  db.updateTeacherPersonal(
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
