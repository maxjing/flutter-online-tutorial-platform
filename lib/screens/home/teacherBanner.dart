import 'package:flutter/material.dart';
import '../../style.dart';
import '../../models/teacher.dart';

class TeacherBanner extends StatelessWidget {
  final String _assetPath;
  final String _firstName;
  final String _lastName;
  final String _age;
  final String _desc;

  TeacherBanner(
      this._assetPath, this._firstName, this._lastName, this._age, this._desc);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60.0,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(_assetPath, fit: BoxFit.cover),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _firstName,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                                color: Colors.black),
                          ),
                          Text(
                            ' ' + _lastName,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                                color: Colors.black),
                          ),
                          Text(
                            ' | ' + _age,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Text(
                        _desc,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
            ])),
          ],
        ));
  }
}
