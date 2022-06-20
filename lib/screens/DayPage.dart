// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:wearable_project/screens/BMI/age_weight_widget.dart';
import 'package:wearable_project/database/database.dart';

class DayPage extends StatelessWidget {
  DayPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'DayPage';
  int _number = 1;

  @override
  Widget build(BuildContext context) {
    print('${DayPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Day'),
        backgroundColor: Color.fromARGB(255, 18, 48, 124),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              height: 50,
            ),
            SizedBox(
              child: Text(
                'Select a day from 15/05/2022 to 28/05/2022',
                style: TextStyle(fontSize: 18),
              ),
              width: 500,
              height: 100,
            ),
            AgeWeightWidget(
                onChange: (numberVal) {
                  _number = numberVal;
                },
                title: "Select the Day",
                initValue: 1,
                min: 1,
                max: 14),
            SizedBox(
              width: 50,
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                final database = await $FloorAppDatabase
                    .databaseBuilder('app_database.db')
                    .build();

                final caloriesDao = database.caloriesDao;
                _number = _number - 1;
                final result = await caloriesDao.findCaloriesById(_number);

                final stepsDao = database.stepsDao;
                final risultato = await stepsDao.findStepsById(_number);

                final res = [result!.value, risultato!.value];

                Navigator.pushNamed(context, 'AttivityPage', arguments: res);
              },
              child: const Text('Show Result'),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 18, 48, 124),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ],
        ),
      )),
    );
  } //build

} //Page