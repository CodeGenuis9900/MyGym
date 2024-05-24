// Define the exercises table
import 'package:drift/drift.dart';

class ExerciseItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text().withLength(min: 1, max: 50)();
}