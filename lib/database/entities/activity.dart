import 'dart:ffi';

import 'package:floor/floor.dart';

@entity
class Steps {
  //id will be the primary key of the table. Moreover, it will be autogenerated.
  //id is nullable since it is autogenerated.
  @PrimaryKey(autoGenerate: true)
  final int? id;

  //For the sake of simplicity, a Todo has only a name.
  final double? value;

  //Default constructor
  Steps(this.id, this.value);
}

class Calories {
  //id will be the primary key of the table. Moreover, it will be autogenerated.
  //id is nullable since it is autogenerated.
  @PrimaryKey(autoGenerate: true)
  final int? id;

  //For the sake of simplicity, a Todo has only a name.
  final String value;

  //Default constructor
  Calories(this.id, this.value);
}