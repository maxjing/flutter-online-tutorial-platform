import 'dart:developer';
import 'package:flutter/material.dart';
import './screens/favourite/favourite.dart';
import './screens/timetable/timetable.dart';
import './screens/home/home.dart';
import './screens/profile/profile.dart';
import 'package:easy_localization/easy_localization.dart';

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

  switchLanguage(Locale locale) {
    EasyLocalization.of(context).locale = locale;
  }

  @override
  Widget build(BuildContext context) {
    log(EasyLocalization.of(context).locale.toString(), name: this.toString());
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("title").tr(args: ['jj']),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () {
      //       switchLanguage(Locale("zh", "CN"));
      //     },
      //   ),
      // ),
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
