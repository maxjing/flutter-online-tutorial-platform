import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../style.dart';
import '../../db.dart';
import '../../models/teacher.dart';

class ProfileSubject extends StatefulWidget {
  final String _uid;
  final Teach _subject;

  ProfileSubject(this._uid, this._subject);

  @override
  _ProfileSubjectState createState() => _ProfileSubjectState();
}

class _ProfileSubjectState extends State<ProfileSubject> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();
  ValueChanged _onChanged = (val) => {};
  final db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        key: _scaffoldstate,
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: FormBuilder(
              key: _fbKey,
              autovalidate: true,
              initialValue: {
                'category': widget._subject.category,
                'name': widget._subject.name,
                'description': widget._subject.description,
                'hourlyRate': widget._subject.hourlyRate == 0
                    ? ''
                    : widget._subject.hourlyRate.toString(),
              },
              readOnly: false,
              child: Column(children: <Widget>[
                FormBuilderDropdown(
                  attribute: "category",
                  decoration: InputDecoration(
                    labelText: tr('subject.category'),
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: TextFieldBGColor,
                  ),
                  onChanged: _onChanged,
                  validators: [
                    FormBuilderValidators.required(),
                  ],
                  items:
                      ['Wellness', 'Academic', 'Fine Arts', 'Skills', 'Other']
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text('$category'),
                              ))
                          .toList(),
                ),
                SizedBox(height: 10),
                FormBuilderTextField(
                  attribute: "name",
                  readOnly: false,
                  decoration: InputDecoration(
                    labelText: tr('subject.name'),
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
                SizedBox(height: 10),
                FormBuilderTextField(
                  attribute: "description",
                  readOnly: false,
                  decoration: InputDecoration(
                    labelText: tr('subject.description'),
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
                SizedBox(height: 10),
                FormBuilderTextField(
                  attribute: "hourlyRate",
                  readOnly: false,
                  decoration: InputDecoration(
                    labelText: tr('subject.hourlyRate'),
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.attach_money),
                    filled: true,
                    fillColor: TextFieldBGColor,
                  ),
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.max(999),
                    FormBuilderValidators.min(20)
                  ],
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20.0),
                MaterialButton(
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
                      if (widget._subject.id != '') {
                        db.updateSubject(widget._uid, widget._subject.id,
                            _fbKey.currentState.value);
                      } else {
                        db.createSubject(widget._uid, widget._subject.id,
                            _fbKey.currentState.value);
                      }

                      _scaffoldstate.currentState.showSnackBar(
                        SnackBar(content: Text('Submitting')),
                      );
                    } else {
                      _scaffoldstate.currentState.showSnackBar(
                        SnackBar(
                            content: Text('Please complete the form properly')),
                      );
                    }
                  },
                ),
              ])),
        ));
  }
}
