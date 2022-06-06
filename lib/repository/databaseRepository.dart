import 'package:wearable_project/database/database.dart';
import 'package:wearable_project/database/entities/activity.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier {
  //The state of the database is just the AppDatabase
  final AppDatabase database;

  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllTodos() method of the DAO
  Future<List<Steps>> findAllSteps() async {
    final results = await database.stepsDao.findAllSteps();
    return results;
  } //findAllTodos

  //This method wraps the insertTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> insertTodo(Steps steps) async {
    await database.stepsDao.insertSteps(steps);
    notifyListeners();
  } //insertTodo

  //This method wraps the deleteTodo() method of the DAO.
  //Then, it notifies the listeners that something changed.
  Future<void> removeTodo(Steps steps) async {
    await database.stepsDao.deleteSteps(steps);
    notifyListeners();
  } //removeTodo
} //DatabaseRepository
