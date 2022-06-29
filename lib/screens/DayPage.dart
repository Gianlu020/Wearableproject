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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 166, 166, 166),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Day Selection'),
        backgroundColor: Color.fromARGB(255, 166, 24, 24),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(12),
        color: Color.fromARGB(255, 0, 74, 173),
        child: Card(
          color: Color.fromARGB(255, 217, 214, 214),
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      'Select a day \n \n from 15/05/2022 to 28/05/2022\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 74, 173),
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AgeWeightWidget(
                          onChange: (numberVal) {
                            _number = numberVal;
                          },
                          title: "Select the Day",
                          initValue: 1,
                          min: 1,
                          max: 14),
                    ),
                  ],
                ),
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
                child: const Text(
                  'Show Result',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Color.fromARGB(255, 0, 74, 173),
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ],
          ),
        ),
      )),
    );
  } //build

} //Page
