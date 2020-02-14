import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  int _index;
  BottomNavigation(this._index);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 30.0,
      currentIndex: widget._index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), title: Text('Favourite')),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), title: Text('Timetable')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text('Profile')),
      ],
      onTap: (index) {
        setState(() {
          widget._index = index;
        });
      },
    );
  }
}
