import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: "what area are you looking for",
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
