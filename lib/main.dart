import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'style.dart';

void main() => runApp(App());

const LocationsRoute = '/';
const LocationDetailRoute = '/location_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // onGenerateRoute: _routes(),
      home: Home(),
      theme: _theme(),
    );
  }

  // RouteFactory _routes() {
  //   return (settings) {
  //     final Map<String, dynamic> arguments = settings.arguments;
  //     Widget screen;
  //     switch (settings.name) {
  //       case LocationsRoute:
  //         screen = Locations();
  //         break;
  //       case LocationDetailRoute:
  //         screen = LocationDetail(arguments['id']);
  //         break;
  //       default:
  //         return null;
  //     }
  //     return MaterialPageRoute(builder: (BuildContext context) => screen);
  //   };
  // }

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
