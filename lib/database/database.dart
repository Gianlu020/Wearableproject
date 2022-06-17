// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'entity/dao/steps_dao.dart';
import 'entity/steps.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Steps,Calories])
abstract class AppDatabase extends FloorDatabase {
  StepsDao get stepsDao;
  CaloriesDao get caloriesDao;
}