import 'package:armanogroup/screens/login/login.dart';
import 'package:armanogroup/screens/signup/signup.dart';
import 'package:armanogroup/screens/splash_screen.dart';
import 'package:armanogroup/utills/MyColors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Armano Group ',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: Signup(),
    );
  }
}
