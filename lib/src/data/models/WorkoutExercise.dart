// Define the many-to-many relationship between workouts and exercises
import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/Exercise.dart';
import 'package:mygym/src/data/models/Workout.dart';

class WorkoutExercise extends Table {
  IntColumn get workoutId => integer().nullable().references(Workout, #id)();
  IntColumn get exerciseId => integer().nullable().references(Exercise, #id)();
}
