import 'package:flutter/material.dart';
import '../../style.dart';
import '../../helper.dart';

class Home extends StatelessWidget {
  Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: getScreenHeight() * 0.045,
              width: getScreenWidth() * 0.4,
              decoration: BoxDecoration(
                  color: ThemeColor,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0))),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    semanticLabel: 'Your Location',
                  ),
                ),
                Text(
                  'Vancouver',
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: Colors.white),
                )
              ])),
          Container(
              // padding: const EdgeInsets.only(right: 10.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.mail_outline,
                color: ThemeColor,
                size: 30,
                semanticLabel: 'Messages',
              ),
            ),
            Image.asset(
              'assets/images/profileIcon.png',
              height: getScreenHeight() * 0.045,
              width: getScreenHeight() * 0.04,
              fit: BoxFit.cover,
            ),
          ])),
        ],
      ));

  Widget searchBar = Container(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: SearchBarColor,
        border: InputBorder.none,
        hintText: "Enter Your Name",
        prefixIcon: Icon(Icons.search),
        labelStyle: new TextStyle(color: Colors.black),
        // ),
      ),
    ),
  );

  Widget header = Container(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: SearchBarColor,
        border: InputBorder.none,
        hintText: "Enter Your Name",
        prefixIcon: Icon(Icons.search),
        labelStyle: new TextStyle(color: Colors.black),
        // ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [titleSection, searchBar]),
    );
  }
}
