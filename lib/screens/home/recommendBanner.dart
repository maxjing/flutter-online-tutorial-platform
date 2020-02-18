import 'package:flutter/material.dart';

class RecommendBanner extends StatelessWidget {
  final String _assetPath;
  final String _text;
  final String _desc;

  RecommendBanner(this._assetPath, this._text, this._desc);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        height: 67.0,
        child: Image.asset(_assetPath, fit: BoxFit.cover),
      ),
      Container(
          padding: const EdgeInsets.all(7.0),
          width: width * 0.4,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              _text,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  color: Colors.black),
            ),
            Text(
              _desc,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 10.0,
                  color: Colors.grey),
            ),
          ]))
    ]));
  }
}
