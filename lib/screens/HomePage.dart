import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wearable_project/screens/LoginPage.dart';
import 'package:wearable_project/screens/PassiPage.dart';
import 'package:wearable_project/screens/AttivityPage.dart';
import 'package:wearable_project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:wearable_project/screens/BMI/BMIpage.dart';

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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            child: Text('Hello : $message'),
          ),
          SizedBox(height: 300,width: 300,child: Image.asset('assets/images/corsa.jpg',),),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'PassiPage');
            },
            child: const Text('Passi'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          ),
          SizedBox(height: 50,width: 60),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'AttivityPage');
            },
            child: const Text('Attività'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          ),
           SizedBox(height: 50,width: 60),
           ElevatedButton(onPressed: (){
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
              child: Text('App Sport'),
            ),
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
                  final stepsData = await fitbitActivityTimeseriesDataManager
                      .fetch(FitbitActivityTimeseriesAPIURL.dateRangeWithResource(userID:'7ML2XV' ,
                        startDate:DateTime.utc(2022, 05, 15), endDate: DateTime.utc(2022, 05, 28), resource: fitbitActivityTimeseriesDataManager.type)
                        )as List<FitbitActivityTimeseriesData>;
                        final  day1=stepsData[0];
                        print(day1);
                }
                ),
                ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Fetch calories data'),
                onTap: () async{
                  FitbitActivityTimeseriesDataManager
                      fitbitActivityTimeseriesDataManager =
                      FitbitActivityTimeseriesDataManager(
                    clientID: '238C6C',
                    clientSecret: 'd1e8a025414a71fcec5d0b2d306aac9c',
                    type: 'calories',
                  );
                  final caloriesData = await fitbitActivityTimeseriesDataManager
                      .fetch(FitbitActivityTimeseriesAPIURL.dateRangeWithResource(userID:'7ML2XV' ,
                        startDate:DateTime.utc(2022, 05, 15), endDate: DateTime.utc(2022, 05, 28), resource: fitbitActivityTimeseriesDataManager.type)
                        )as List<FitbitActivityTimeseriesData>;
                        final  day1c=caloriesData[0];
                        print(day1c);
                }
                ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  _toLoginPage(context);
                }
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
