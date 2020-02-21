import 'package:flutter/material.dart';
import 'routes.dart';
import 'screens/home/home.dart';
import 'screens/teacher/teacher.dart';
import 'screens/favourite/favourite.dart';
import 'screens/timetable/timetable.dart';
import 'screens/profile/profile.dart';
import 'screens/login/login.dart';
import 'style.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      home: Home(),
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
        case FavouriteRoute:
          screen = Favourite();
          break;
        case TimetableRoute:
          screen = Timetable();
          break;
        case ProfileRoute:
          screen = Login();
          break;
        case TeacherRoute:
          screen = Teacher(arguments['id']);
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
