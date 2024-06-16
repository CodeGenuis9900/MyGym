import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/session.dart';
import 'package:mygym/src/data/repositories/database.dart';

class SessionRepository {
  final AppDatabase db;

  SessionRepository(this.db);

  Future<List<SessionData>> getAllSessions() => db.select(db.session).get();

  Future<int> addSession(SessionCompanion entry) {
    return db.into(db.session).insert(entry);
  }

  Future<List<SessionData>> getSessionsByWorkoutId(int workoutId) {
    return (db.select(db.session)..where((t) => t.workoutId.equals(workoutId))).get();
  }
}
