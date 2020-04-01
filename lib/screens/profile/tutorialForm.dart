import 'package:airtnl/routes.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:developer';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../style.dart';
import '../../db.dart';
import '../../models/teacher.dart';
import '../../components/area_banner.dart';

class TutorialForm extends StatefulWidget {
  @override
  _TutorialFormState createState() => _TutorialFormState();
  final String uid;
  TutorialForm(this.uid);
}

class _TutorialFormState extends State<TutorialForm> {
  final db = DatabaseService();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  ValueChanged _onChanged = (val) => {};
  List<dynamic> _subjects = [];
  Teach teach = Teach.initializer();
  @override
  Widget build(BuildContext context) {
    final db = DatabaseService();

    var teacher = Provider.of<Teacher>(context);
    var teaches = Provider.of<List<Teach>>(context);

    if (teaches != []) {
      setState(() {
        _subjects = new List.from(teaches, growable: true);
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
                      'areas': new List.from(teacher.areas, growable: true),
                      'teachOnline': teacher.teachOnline,
                      'highlight': teacher.highlight,
                      'introduction': teacher.introduction,
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
                              tr('info.highlight.label'),
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
                          attribute: "highlight",
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: tr('info.highlight.hint'),
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: TextFieldBGColor,
                          ),
                          onChanged: _onChanged,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.pattern('^(?! ).*(?<! )\$',
                                errorText:
                                    'Spaces at the beginning and end are not allowed')
                          ],
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 20.0),
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              tr('info.introduction.label'),
                              style: BodyBoldText,
                            )),
                        SizedBox(height: 10.0),
                        FormBuilderTextField(
                          attribute: "introduction",
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: tr('info.introduction.hint'),
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: TextFieldBGColor,
                          ),
                          onChanged: _onChanged,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.pattern('^(?! ).*(?<! )\$',
                                errorText:
                                    'Spaces at the beginning and end are not allowed')
                          ],
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 20),
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              tr('info.areas.label'),
                              style: BodyBoldText,
                            )),
                        SizedBox(height: 10.0),
                        FormBuilderCheckboxList(
                          decoration: InputDecoration(
                            labelText: tr('info.areas.hint'),
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
                                  text: tr('info.teachOnline'),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              tr('info.subjects'),
                              style: BodyBoldText,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              color: Colors.white,
                              textColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () => Navigator.pushNamed(
                                  context, ProfileSubjectRoute, arguments: {
                                'uid': widget.uid,
                                'subject': teach
                              }),
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        if (teaches != []) ...[
                          Column(
                              children: teaches.map((course) {
                            return Card(
                                child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: AreaBanner(
                                              course.category, course.name),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text(course.description,
                                              style: BodyBoldGreyText),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                            '\$' +
                                                course.hourlyRate.toString() +
                                                '/hour',
                                            style: BodyBoldNormalText),
                                        PopupMenuButton(
                                          onSelected: (String choice) {
                                            _subjectAction(context, choice,
                                                widget.uid, course);
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return ['Edit', 'Delete']
                                                .map((String choice) {
                                              return PopupMenuItem<String>(
                                                value: choice,
                                                child: Text(choice),
                                              );
                                            }).toList();
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ));
                          }).toList())
                        ],
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              tr('info.schedule'),
                              style: BodyBoldText,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              color: Colors.white,
                              textColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              onPressed: () => {},
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ],
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
                                  db.createTeacherTutorial(
                                      widget.uid, _fbKey.currentState.value);
                                } else {
                                  db.updateTeacherTutorial(
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

  _onAlertButtonPressed(context, Teach subject) {
    var courseName = subject.name;
    var hourlyRate = subject.hourlyRate.toString();
    Alert(
      context: context,
      type: AlertType.error,
      title: "CONFIRM TO DELETE",
      desc: "Course $courseName with \$$hourlyRate/hour",
      buttons: [
        DialogButton(
          child: Text(
            "CONFIRM",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => db.deleteSubject(widget.uid, subject.id),
          width: 120,
        )
      ],
    ).show();
  }

  void _subjectAction(
      BuildContext context, String choice, String uid, Teach subject) {
    if (choice == 'Edit') {
      Navigator.pushNamed(context, ProfileSubjectRoute,
          arguments: {'uid': uid, 'subject': subject});
    } else if (choice == 'Delete') {
      _onAlertButtonPressed(context, subject);
    }
  }
}
