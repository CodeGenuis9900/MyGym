import 'package:drift/drift.dart';
import 'package:mygym/src/data/repositories/database.dart';

class SetWorkoutRepository {
  final AppDatabase db;

  SetWorkoutRepository(this.db);

  Future<List<SetWorkoutData>> getAllSets() => db.select(db.setWorkout).get();

  Future<int> addSets(SetWorkoutCompanion entry) {
    return db.into(db.setWorkout).insert(entry);
  }

  Future<List<SetWorkoutData>> getSetsByExerciseId(int exerciseId) {
    return (db.select(db.setWorkout)..where((e) => e.exerciseId.equals(exerciseId))).get();
  }
}
