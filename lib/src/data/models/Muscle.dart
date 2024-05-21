// Define the muscles table
import 'package:drift/drift.dart';

class Muscle extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get color => text().withLength(min: 1, max: 7)(); // Hex color code
}