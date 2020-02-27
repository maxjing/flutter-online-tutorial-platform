import 'package:airtnl/style.dart';
import 'package:flutter/material.dart';
import '../../helper.dart';
import '../../routes.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 0.4 * getScreenHeight()),
                  ButtonTheme(
                      minWidth: getScreenWidth() * 0.8,
                      buttonColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, StudentLoginRoute),
                        child: Text('Student/Parent',
                            style: TextStyle(
                              color: ThemeColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                  SizedBox(height: 20),
                  ButtonTheme(
                      minWidth: getScreenWidth() * 0.8,
                      buttonColor: TeacherLoginButtonColor,
                      padding: const EdgeInsets.all(15),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, TeacherLoginRoute),
                        child: Text('Teacher',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                ])));
  }
}
