import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../helper.dart';
import '../routes.dart';
import '../style.dart';
import '../screens/profile/info.dart';

class LoginPage extends StatefulWidget {
  final String _userType;
  final String _assetPath;
  final String _signupRoute;
  LoginPage(this._userType, this._assetPath, this._signupRoute);

  @override
  _LoginPagerState createState() => _LoginPagerState();
}

class _LoginPagerState extends State<LoginPage> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future registerUser(String mobile, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: mobile,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) {
          _auth.signInWithCredential(credential).then((AuthResult result) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Info(user: result.user)));
          }).catchError((e) {
            print(e);
          });
        },
        verificationFailed: (AuthException authException) {
          print(authException.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Please enter the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        _auth
                            .signInWithCredential(credential)
                            .then((AuthResult result) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Info(user: result.user)));
                        }).catchError((e) {
                          print(e);
                        });
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
          print(verificationId);
          print("Timout");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget._assetPath),
                fit: BoxFit.cover,
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
                          onTap: () => Navigator.pushNamed(context, HomeRoute),
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
                    child: Text(widget._userType,
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
                              controller: _phoneController,
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
                                hintText: "PHONE NUMBER",
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
                      SizedBox(height: 10.0),
                      ButtonTheme(
                        minWidth: getScreenWidth() * 0.9,
                        buttonColor: Colors.white,
                        padding: const EdgeInsets.all(20),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17.0),
                            ),
                            onPressed: () {
                              final mobile = _phoneController.text.trim();
                              registerUser(mobile, context);
                            },
                            child: Text('LOG IN')),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                          padding: EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, widget._signupRoute),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      alignment: Alignment.bottomLeft,
                                      child: Text('New User?',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text('Sign up',
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                color: TeacherSignupButtonColor,
                                                fontWeight: FontWeight.bold)),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ])
                                ],
                              ))),
                    ],
                  ),
                )
              ],
            )));
  }
}
