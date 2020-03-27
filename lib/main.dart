import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'style.dart';
import 'routes.dart';
import 'bottomNavigation.dart';
import 'screens/home/home.dart';
import 'screens/teacher/teacherDetail.dart';
import 'screens/favourite/favourite.dart';
import 'screens/timetable/timetable.dart';
import 'screens/profile/profile.dart';
import 'screens/login/login.dart';
import 'screens/login/teacherLogin.dart';
import 'screens/login/studentLogin.dart';
import 'screens/signup/teacherSignup.dart';
import 'screens/signup/studentSignup.dart';
import 'screens/profile/info.dart';
import 'screens/courses/courses.dart';
import 'screens/profile/language.dart';

void main() => runApp(EasyLocalization(
    child: App(),
    supportedLocales: [
      Locale('en', 'US'),
      Locale('zh', 'CN'),
      Locale('zh', 'HK')
    ],
    path: 'assets/langs'));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
            value: FirebaseAuth.instance.onAuthStateChanged),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasyLocalization.of(context).delegate,
        ],
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        onGenerateRoute: _routes(),
        home: _getLandingPage(),
        theme: _theme(),
      ),
    );
  }

  Widget _getLandingPage() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return BottomNavigationBarController();
        }

        return Login();
      },
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case IndexRoute:
          screen = BottomNavigationBarController();
          break;
        case HomeRoute:
          screen = BottomNavigationBarController();
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
          screen = TeacherDetail(arguments['id']);
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
        case CoursesRoute:
          screen = Courses(arguments['id']);
          break;
        case LanguageRoute:
          screen = Language();
          break;

        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
      primaryColor: ThemeColor,
      hintColor: HintColor,
      // appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
      // textTheme: TextTheme(
      //   title: TitleTextStyle,
      //   body1: Body1TextStyle,
      // )
    );
  }
}
