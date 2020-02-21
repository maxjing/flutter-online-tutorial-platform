import 'package:flutter/material.dart';
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
                SizedBox(height: 30),
                Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            child: const Text('Back',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            child: const Text('Skip',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                          ),
                        ),
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    alignment: Alignment.topLeft,
                    child: Text('Teacher',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                Container(
                  padding: EdgeInsets.only(top: getScreenHeight() * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(left: 20.0),
                          alignment: Alignment.bottomLeft,
                          child: Text('Log in',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            child: TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
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
                              // autofocus: true,

                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(17.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.3),
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
                      SizedBox(height: 20.0),
                      ButtonTheme(
                        minWidth: getScreenWidth() * 0.9,
                        buttonColor: Colors.white,
                        padding: const EdgeInsets.all(20),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.0),
                            ),
                            onPressed: () {},
                            child: Text('LOG IN')),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(
                              0, getScreenWidth() * 0.1, 20.0, 0),
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('Sign up',
                                  style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}
