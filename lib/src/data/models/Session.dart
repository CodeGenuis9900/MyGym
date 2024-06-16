import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/Workout.dart';

// Define the sessions table
class Session extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameSession => text().withLength(min: 1, max: 50)();
  IntColumn get workoutId => integer().nullable().references(Workout, #id)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
}
