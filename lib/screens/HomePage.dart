import 'package:flutter/material.dart';
import 'package:wearable_project/database/entity/steps.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wearable_project/screens/LoginPage.dart';
import 'package:wearable_project/screens/DayPage.dart';
import 'package:wearable_project/screens/AttivityPage.dart';
import 'package:wearable_project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:wearable_project/screens/BMI/BMIpage.dart';
import 'package:wearable_project/database/database.dart';

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
        title: Text('App Sport'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            child: Text(
              'Hello $message',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(
            height: 300,
            width: 300,
            child: Image.asset(
              'assets/images/corsa.jpg',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'DayPage');
            },
            child: const Text('Select Day'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          ),
          SizedBox(height: 50, width: 60),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'BMIPage');
            },
            child: const Text('BMI'),
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
              child: Text(
                'App Sport',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.add_moderator_rounded),
                title: const Text('Authorize Fitbit'),
                onTap: () async{
                 String? userId = await FitbitConnector.authorize(
                      context: context,
                      clientID: '238C6C',
                      clientSecret: 'd1e8a025414a71fcec5d0b2d306aac9c',
                      redirectUri: 'example://fitbit/auth',
                      callbackUrlScheme: 'example');
                }),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Fetch steps data'),
                onTap: () async {
                  FitbitActivityTimeseriesDataManager
                      fitbitActivityTimeseriesDataManager =
                      FitbitActivityTimeseriesDataManager(
                    clientID: '238C6C',
                    clientSecret: 'd1e8a025414a71fcec5d0b2d306aac9c',
                    type: 'steps',
                  );
                  final stepsData =
                      await fitbitActivityTimeseriesDataManager.fetch(
                          FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
                              userID: '7ML2XV',
                              startDate: DateTime.utc(2022, 05, 15),
                              endDate: DateTime.utc(2022, 05, 28),
                              resource: fitbitActivityTimeseriesDataManager
                                  .type)) as List<FitbitActivityTimeseriesData>;

                  final database = await $FloorAppDatabase
                      .databaseBuilder('app_database.db')
                      .build();

                  final stepsDao = database.stepsDao;

                  //for (var i = 0; i < 14; i++) {
                  //final passi = Steps(i, stepsData[i].value);
                  //await stepsDao.insertSteps(passi);
                  //} //for

                  final result = await stepsDao.findAllSteps();
                  for (var i = 0; i < result.length; i++) {
                    print(result[i].value);
                  } //for
                }),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Fetch calories data'),
                onTap: () async {
                  FitbitActivityTimeseriesDataManager
                      fitbitActivityTimeseriesDataManager =
                      FitbitActivityTimeseriesDataManager(
                    clientID: '238C6C',
                    clientSecret: 'd1e8a025414a71fcec5d0b2d306aac9c',
                    type: 'calories',
                  );
                  final caloriesData =
                      await fitbitActivityTimeseriesDataManager.fetch(
                          FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
                              userID: '7ML2XV',
                              startDate: DateTime.utc(2022, 05, 15),
                              endDate: DateTime.utc(2022, 05, 28),
                              resource: fitbitActivityTimeseriesDataManager
                                  .type)) as List<FitbitActivityTimeseriesData>;
                  final database = await $FloorAppDatabase
                      .databaseBuilder('app_database.db')
                      .build();

                  final caloriesDao = database.caloriesDao;

                  //for (var i = 0; i < 14; i++) {
                    //final calorie = Calories(i, caloriesData[i].value);
                    //await caloriesDao.insertCalories(calorie);
                  //}

                  final result = await caloriesDao.findCaloriesById(13);
                  print(result!.value);
                  //for (var i = 0; i < result.length; i++) {
                    //print(result[i].value);
                  //}
                }),
                ListTile(
                leading: const Icon(Icons.remove_moderator_sharp),
                title: const Text('Unauthorize Fitbit'),
                onTap: ()async {
                  await FitbitConnector.unauthorize(
                  clientID: '238C6C',
                  clientSecret: 'd1e8a025414a71fcec5d0b2d306aac9c',);
                }),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  _toLoginPage(context);
                }),
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
  }
} //HomePage
