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