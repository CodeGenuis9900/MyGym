// Define the exercises table
import 'package:drift/drift.dart';

class Exercise extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
}