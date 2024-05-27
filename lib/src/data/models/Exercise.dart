// Define the exercises table
import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/Exercise.item.dart';
import 'package:mygym/src/data/models/Workout.dart';

class Exercise extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get repetition => integer()();
  IntColumn get exerciseItemId =>
      integer().nullable().references(ExerciseItem, #id)();
  IntColumn get points => integer()();
  IntColumn get workoutId => integer().nullable().references(Workout, #id)();
}
