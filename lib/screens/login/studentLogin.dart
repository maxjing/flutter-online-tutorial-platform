import 'package:flutter/material.dart';
import '../../components/login_page.dart';

class StudentLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage('Student/Parent', 'assets/images/bg_login_student.png',
        '/signup/student');
  }
}
