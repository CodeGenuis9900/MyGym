// Define the exercises table
import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/Exercise.item.dart';

import 'Workout.dart';

class Exercise extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get exerciseItemId => integer().nullable().references(ExerciseItem, #id)();
  IntColumn get workoutId => integer().nullable().references(Workout, #id)();
}