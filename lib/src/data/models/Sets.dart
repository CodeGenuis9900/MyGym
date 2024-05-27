import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/Exercise.dart';
import 'package:mygym/src/data/models/Workout.dart';

// Define the sessions table
class Sets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get exerciseId => integer().nullable().references(Exercise, #id)();
  IntColumn get points => integer()();
  IntColumn get weight => integer()();
}
