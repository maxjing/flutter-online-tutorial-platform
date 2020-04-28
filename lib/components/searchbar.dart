import 'package:flutter/material.dart';
import '../style.dart';

class Searchbar extends StatefulWidget {
  final String hintText;
  Searchbar(this.hintText);
  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black26),
          prefixIcon: const Icon(
            Icons.search,
          ),
          labelStyle: TextStyle(color: Colors.black),
          // ),
        ),
      ),
    );
  }
}
