import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String _assetPath;
  final String _text;

  CategoryButton(this._assetPath, this._text);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60.0,
        height: 60.0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(_assetPath, fit: BoxFit.cover),
          Text(
            _text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.black),
          ),
        ]));
  }
}
