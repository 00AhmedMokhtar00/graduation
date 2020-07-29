import 'package:flutter/material.dart';
import 'package:graduation/ui/login.dart';
import 'package:graduation/ui/sign_up.dart';
import 'package:graduation/ui/user_type.dart';
import 'package:graduation/ui/welcome.dart';

void main(){

  runApp(GraduationProject());
}

class GraduationProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: LogIn(),
      theme: ThemeData(
        primaryColor: Color(0xff001222),
        accentColor: Color(0xffddbb00)
      ),
    );
  }
}
