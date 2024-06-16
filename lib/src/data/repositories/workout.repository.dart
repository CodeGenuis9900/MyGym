// import 'package:drift/drift.dart';
//
// import 'database.dart';
//
// class WorkoutRepository {
//   final AppDatabase _db;
//
//   WorkoutRepository(this._db);
//
//   Future<List<WorkoutData>> getAllWorkouts() => _db.getAllWorkout();
//   Future<int> insertWorkout(String name) {
//     final workout = WorkoutCompanion(
//       name: Value(name),
//     );
//     return WorkoutCompanion.insert(workout);
//   }
// }
import 'package:drift/drift.dart';
import 'package:mygym/src/data/models/workout.dart';
import 'package:mygym/src/data/repositories/database.dart';

class WorkoutRepository {
  final AppDatabase db;

  WorkoutRepository(this.db);

  Future<List<WorkoutData>> getAllWorkouts() => db.select(db.workout).get();

  Future<int> addWorkout(WorkoutCompanion entry) {
    return db.into(db.workout).insert(entry);
  }

  Future<List<WorkoutData>> searchWorkoutsByName(String query) {
    return (db.select(db.workout)..where((t) => t.name.contains(query))).get();
  }
}
