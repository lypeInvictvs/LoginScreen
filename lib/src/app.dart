import 'package:flutter/material.dart';
import 'package:login_screen/src/screens/home_page.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginApp",
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SafeArea(
        child: HomePage(),
      ),
    );
  }
}
