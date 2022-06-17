import 'package:floor/floor.dart';

@entity
class Steps {
  @primaryKey
  final int? id;

  final double? value;

  Steps(this.id, this.value);
}

@entity
class Calories {
  @primaryKey
  final int? id;

  final double? value;

  Calories(this.id, this.value);
}