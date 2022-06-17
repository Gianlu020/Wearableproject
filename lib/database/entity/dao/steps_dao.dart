import 'package:floor/floor.dart';
import 'package:wearable_project/database/entity/steps.dart';

@dao
abstract class StepsDao {
  @Query('SELECT * FROM Steps')
  Future<List<Steps>> findAllSteps();

  @Query('SELECT * FROM Steps WHERE id = :id')
  Future<Steps?> findStepsById(int id);

  @insert
  Future<void> insertSteps(Steps steps);
}

@dao
abstract class CaloriesDao {
  @Query('SELECT * FROM Calories')
  Future<List<Calories>> findAllCalories();

  @Query('SELECT * FROM Calories WHERE id = :id')
  Future<Calories?> findCaloriesById(int id);

  @insert
  Future<void> insertCalories(Calories calories);
}