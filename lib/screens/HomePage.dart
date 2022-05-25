import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wearable_project/screens/LoginPage.dart';
import 'package:wearable_project/screens/PassiPage.dart';
import 'package:wearable_project/screens/CuorePage.dart';
import 'package:wearable_project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const route = '/home/';
  static const routename = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print('${HomePage.routename} built');
    final message = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Luca&Gianlu&Giorgia'),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: [
          SizedBox(
            child: Text('Hello : $message'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'PassiPage');
            },
            child: const Text('Passi'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          ),
          //],
          // ),
          //SizedBox(
          // width: 30,
          //  height: 30,
          //),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'CuorePage');
            },
            child: const Text('Battiti'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          )
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Luca&Gianlu&Giorgia'),
            ),
            ListTile(
                leading: const Icon(Icons.manage_accounts_outlined),
                title: const Text('Authorization'),
                onTap: () async{
                 String? userId = await FitbitConnector.authorize(
                      context: context,
                      clientID: '238C6C',
                      clientSecret: 'd1e8a025414a71fcec5d0b2d306aac9c',
                      redirectUri: 'example://fitbit/auth',
                      callbackUrlScheme: 'example');
                },
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  _toLoginPage(context);
                }
                //onTap: () => Navigator.pop(context) //_toLoginPage(context),
                ),
          ],
        ),
      ),
    );
  } 
 //build
  void _toLoginPage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference 
    final sp = await SharedPreferences.getInstance();
    sp.remove('username');
    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context).pushReplacementNamed('LoginPage');
  } } //HomePage
