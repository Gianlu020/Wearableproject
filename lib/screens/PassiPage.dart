import 'dart:ffi';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:provider/provider.dart';
import 'package:wearable_project/repository/databaseRepository.dart';
import 'package:wearable_project/database/entities/activity.dart';
import 'package:wearable_project/database/daos/stepsDao.dart';
import 'package:wearable_project/database/database.dart';
import 'package:wearable_project/main.dart';

class PassiPage extends StatelessWidget {
  PassiPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'PassiPage';

  @override
  Widget build(BuildContext context) {
    print('${PassiPage.routename} built');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Passi'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('HomePage'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
              ElevatedButton(
                onPressed: () async {
                  FitbitActivityTimeseriesDataManager
                      fitbitActivityTimeseriesDataManager =
                      FitbitActivityTimeseriesDataManager(
                    clientID: '238C6C',
                    clientSecret: 'd1e8a025414a71fcec5d0b2d306aac9c',
                    type: 'steps',
                  );
                  final stepsData = await fitbitActivityTimeseriesDataManager
                      .fetch(FitbitActivityTimeseriesAPIURL.dayWithResource(
                    date: DateTime.now().subtract(Duration(days: 3)),
                    userID: '7ML2XV',
                    resource: fitbitActivityTimeseriesDataManager.type,
                  )) as List<FitbitActivityTimeseriesData>;
                  final day1 = stepsData[0].value;
                  print(day1);
                  //await Provider.of<DatabaseRepository>(context,
                  //      listen: false)
                  //   .insertTodo(Steps(null, day1.value));
                  // print(Steps.findAllSteps());
                  final database = await $FloorAppDatabase
                      .databaseBuilder('app_database.db')
                      .build();

                  final stepsDao = database.stepsDao;
                  final person = Steps(null, day1);

                  await stepsDao.insertSteps(person);
                  final result = await stepsDao.findStepsById(1);
                  print(result);
                },
                child: const Text('Fetch Data'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              )
            ],
          ),
        ));
  } //build

} //Page