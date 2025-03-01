import 'package:flutter/material.dart';
import 'package:food/screen/home.dart';
import 'users/signup.dart';
import 'users/login.dart';
import 'package:food/screen/firstpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignupScreen(),
        "/home": (context) => HomeScreen(),
        "/firstpage": (context) => FirstPage(),
      },
    );
  }
}





