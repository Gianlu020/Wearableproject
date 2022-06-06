import 'package:wearable_project/database/entities/activity.dart';
import 'package:floor/floor.dart';

@dao
abstract class StepsDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Todo table
  @Query('SELECT * FROM Steps')
  Future<List<Steps>> findAllSteps();

  //Query #2: INSERT -> this allows to add a Todo in the table
  @insert
  Future<void> insertSteps(Steps steps);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> deleteSteps(Steps task);
} //TodoDao

abstract class CaloriesDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Todo table
  @Query('SELECT * FROM Steps')
  Future<List<Calories>> findAllCalories();

  //Query #2: INSERT -> this allows to add a Todo in the table
  @insert
  Future<void> insertCalories(Calories calories);

  //Query #3: DELETE -> this allows to delete a Todo from the table
  @delete
  Future<void> deleteCalories(Calories task);
}//TodoDao