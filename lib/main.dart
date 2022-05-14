import 'package:flutter/material.dart';
import 'package:wearable_project/screens/HomePage.dart';
import 'package:wearable_project/screens/LoginPage.dart';
import 'package:wearable_project/screens/PassiPage.dart';
import 'package:wearable_project/screens/CuorePage.dart';
//TODO: import the homepage widget

void main() {
  runApp(MyApp());
} //main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'LoginPage',
      //This maps names to the set of routes within the app
      routes: {
        'LoginPage': (context) => LoginPage(),
        'HomePage': (context) => HomePage(),
        'PassiPage': (context) => PassiPage(),
        'CuorePage': (context) => CuorePage(),
      },
    );
  } //build
}//MyApp