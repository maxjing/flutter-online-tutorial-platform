import 'package:flutter/material.dart';
import '../bottomNavigation/bottomNavigation.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [Text('Favourite')]),
        bottomNavigationBar: BottomNavigation(1));
  }
}
