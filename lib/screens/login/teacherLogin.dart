import 'package:flutter/material.dart';
import '../../components/login_page.dart';

class TeacherLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage(
        'Teacher', 'assets/images/bg_login_teacher.png', '/signup/teacher');
  }
}
