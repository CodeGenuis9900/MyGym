import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/exercise.dart';
import 'package:mygym/src/data/repositories/database.dart';

class ExerciseRepository {
  final AppDatabase db;

  ExerciseRepository(this.db);

  Future<List<ExerciseData>> getAllExercises() => db.select(db.exercise).get();

  Future<int> addExercise(ExerciseCompanion entry) {
    return db.into(db.exercise).insert(entry);
  }

  Future<List<ExerciseData>> getExercisesByWorkoutId(int workoutId) {
    return (db.select(db.exercise)..where((e) => e.workoutId.equals(workoutId))).get();
  }
}
