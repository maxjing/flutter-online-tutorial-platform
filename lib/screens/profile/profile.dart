import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routes.dart';

class Profile extends StatelessWidget {
  Profile({Key key}) : super(key: key);
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
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
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text('Log in')),
          SizedBox(height: 30.0),
          RaisedButton(child: Text("sign out"), onPressed: auth.signOut),
          FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () => _onInfoTap(context, user.uid),
              child: Text('Info'))
        ],
      ),
    ));
  }

  _onInfoTap(BuildContext context, String id) {
    Navigator.pushNamed(context, ProfileInfoRoute);
  }
}
