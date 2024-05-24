// Define the many-to-many relationship between sessions and muscles
import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/Exercise.item.dart';
import 'package:mygym/src/data/models/Muscle.dart';


class ExerciseItemMuscle extends Table {
  IntColumn get exerciseId => integer().nullable().references(ExerciseItem, #id)();
  IntColumn get muscleId => integer().nullable().references(Muscle, #id)();
  RealColumn get percentage => real()();
}