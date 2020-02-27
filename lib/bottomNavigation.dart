import 'package:flutter/material.dart';
import './screens/favourite/favourite.dart';
import './screens/timetable/timetable.dart';
import './screens/home/home.dart';
import './screens/profile/profile.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    Home(
      key: PageStorageKey('home'),
    ),
    Favourite(
      key: PageStorageKey('favourite'),
    ),
    Timetable(
      key: PageStorageKey('timetable'),
    ),
    Profile(
      key: PageStorageKey('profile'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30.0,
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            title: Text('Favourite'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text('Timetable')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('Profile')),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
