import 'package:flutter/material.dart';
import 'package:wearable_project/screens/BMI/BMIpage.dart';
import 'package:wearable_project/screens/HomePage.dart';
import 'package:wearable_project/screens/LoginPage.dart';
import 'package:wearable_project/screens/DayPage.dart';
import 'package:wearable_project/screens/AttivityPage.dart';
import 'package:wearable_project/screens/PrizePage1.dart';
import 'package:wearable_project/screens/PrizePage2.dart';
import 'package:wearable_project/screens/PrizePage3.dart';
import 'package:wearable_project/database/database.dart';

Future<void> main() async {
  //This is a special method that use WidgetFlutterBinding to interact with the Flutter engine.
  //This is needed when you need to interact with the native core of the app.
  //Here, we need it since when need to initialize the DB before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  //This opens the database.
  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
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
        'DayPage': (context) => DayPage(),
        'AttivityPage': (context) => AttivityPage(),
        'BMIPage': (context) => BMIpage(),
        'PrizePage1': (context) => PrizePage1(),
        'PrizePage2': (context) => PrizePage2(),
        'PrizePage3': (context) => PrizePage3(),
      },
    );
  } //build
}//MyApp


//ciao, sono Gianluca 
//prova
