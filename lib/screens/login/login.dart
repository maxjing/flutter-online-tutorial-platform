import 'package:flutter/material.dart';
import '../bottomNavigation/bottomNavigation.dart';
import '../../helper.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_login_teacher.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            "Back",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          textColor: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () => Navigator.pushNamed(context, '/'),
                          child: Text(
                            "Skip",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.only(top: getScreenHeight() * 0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                filled: true,
                                border: InputBorder.none,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.3),
                                hintText: "USER NAME",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          child: Container(
                            child: TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.3),
                                border: InputBorder.none,
                                hintText: "PASSWORD",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              obscureText: true,
                            ),
                          )),
                      ButtonTheme(
                        minWidth: getScreenWidth() * 0.9,
                        buttonColor: Colors.white,
                        child: RaisedButton(
                            onPressed: () {}, child: Text('LOG IN')),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
