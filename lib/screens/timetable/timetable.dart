import 'package:flutter/material.dart';
import '../bottomNavigation/bottomNavigation.dart';

class Timetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [Text('Timetable')]),
        bottomNavigationBar: BottomNavigation(2));
  }
}
