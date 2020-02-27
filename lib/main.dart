import 'package:flutter/material.dart';
import 'style.dart';
import 'routes.dart';
import 'screens/home/home.dart';
import 'screens/teacher/teacher.dart';
import 'screens/favourite/favourite.dart';
import 'screens/timetable/timetable.dart';
import 'screens/profile/profile.dart';
import 'screens/login/login.dart';
import 'screens/login/teacherLogin.dart';
import 'screens/login/studentLogin.dart';
import 'screens/signup/teacherSignup.dart';
import 'screens/signup/studentSignup.dart';
import 'screens/profile/info.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedPage = 0;
  final _pageOptions = [Home(), Favourite(), Timetable(), Profile()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      home: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30.0,
          currentIndex: _selectedPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
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
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ),
      ),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case IndexRoute:
          screen = Home();
          break;
        case HomeRoute:
          screen = Home();
          break;
        case FavouriteRoute:
          screen = Favourite();
          break;
        case TimetableRoute:
          screen = Timetable();
          break;
        case ProfileRoute:
          screen = Profile();
          break;
        case TeacherRoute:
          screen = Teacher(arguments['id']);
          break;
        case LoginRoute:
          screen = Login();
          break;
        case TeacherLoginRoute:
          screen = TeacherLogin();
          break;
        case StudentLoginRoute:
          screen = StudentLogin();
          break;
        case TeacherSignupRoute:
          screen = TeacherSignup();
          break;
        case StudentSignupRoute:
          screen = StudentSignup();
          break;
        case ProfileInfoRoute:
          screen = Info();
          break;

        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(primaryColor: ThemeColor
        // appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
        // textTheme: TextTheme(
        //   title: TitleTextStyle,
        //   body1: Body1TextStyle,
        // )

        );
  }
}
