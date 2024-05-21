import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/Workout.dart';

// Define the sessions table
class Session extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutId => integer().nullable().references(Workout, #id)();
  DateTimeColumn get date => dateTime()();
}
