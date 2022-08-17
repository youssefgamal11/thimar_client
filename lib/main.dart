import 'package:flutter/material.dart';
import 'package:thimar_app/screens/auth/active_account/view.dart';
import 'package:thimar_app/screens/auth/confirm_code/view.dart';
import 'package:thimar_app/screens/auth/forget_password/view.dart';
import 'package:thimar_app/screens/auth/signup/view.dart';

import 'screens/auth/change_password/view.dart';
import 'screens/auth/login/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
