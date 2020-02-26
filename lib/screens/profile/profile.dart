import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './info.dart';

class Profile extends StatelessWidget {
  final FirebaseUser user;

  Profile({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "You are Logged in succesfully",
            style: TextStyle(color: Colors.lightBlue, fontSize: 32),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            user != null ? "${user.phoneNumber}" : "",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () => Navigator.pushNamed(context, '/signup/teacher'),
              child: Text('Sign up')),
          SizedBox(height: 30.0),
          FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Info(user: user))),
              child: Text('Info'))
        ],
      ),
    ));
  }
}
