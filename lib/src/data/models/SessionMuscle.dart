// Define the many-to-many relationship between sessions and muscles
import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/Muscle.dart';
import 'package:mygym/src/data/models/Session.dart';

class SessionMuscle extends Table {
  IntColumn get sessionId => integer().nullable().references(Session, #id)();
  IntColumn get muscleId => integer().nullable().references(Muscle, #id)();
}