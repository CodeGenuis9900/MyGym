import 'package:drift/drift.dart';

// These additional imports are necessary to open the sqlite3 database
import 'dart:io';
import 'package:drift/native.dart';
import 'package:mygym/src/data/models/Exercise.dart';
import 'package:mygym/src/data/models/Exercise.item.dart';
import 'package:mygym/src/data/models/Muscle.dart';
import 'package:mygym/src/data/models/Session.dart';
import 'package:mygym/src/data/models/Exercice.item.muscle.dart';
import 'package:mygym/src/data/models/Set.workout.dart';
import 'package:mygym/src/data/models/Workout.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  SetWorkout,
  Session,
  Muscle,
  Workout,
  ExerciseItemMuscle,
  Exercise,
  ExerciseItem
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<WorkoutData>> get allWorkouts => select(workout).get();
  Future<int> addWorkout(WorkoutCompanion entry) {
    return into(workout).insert(entry);
  }

  Future<List<WorkoutData>> searchWorkoutsByName(String query) {
    return (select(workout)..where((t) => t.name.contains(query))).get();
  }

  Future<List<SessionData>> get allSessions => select(session).get();
  Future<int> addSession(SessionCompanion entry) {
    return into(session).insert(entry);
  }

  Future<List<SessionData>> getSessionsByWorkoutId(int workoutId) {
    return (select(session)..where((t) => t.workoutId.equals(workoutId))).get();
  }

  Future<List<ExerciseData>> get allExercises => select(exercise).get();
  Future<int> addExercise(ExerciseCompanion input) {
    return into(exercise).insert(input);
  }

  Future<List<ExerciseData>> getExercisesByWorkoutId(int workoutId) {
    return (select(exercise)..where((e) => e.workoutId.equals(workoutId)))
        .get();
  }

  Future<List<SetWorkoutData>> get allSets => select(setWorkout).get();
  Future<int> addSets(SetWorkoutCompanion input) {
    return into(setWorkout).insert(input);
  }

  Future<List<SetWorkoutData>> getSetsByExerciseId(int exerciseId) {
    return (select(setWorkout)..where((e) => e.exerciseId.equals(exerciseId)))
        .get();
  }

  Future<List<ExerciseItemData>> get allExerciseItems =>
      select(exerciseItem).get();

  // Insert initial data
  Future<void> insertInitialMuscles(Batch batch) async {
    List<Map<String, dynamic>> initialMuscles = [
      {'name': 'Pectorals', 'color': 'FF6347'}, // Tomato
      {'name': 'Latissimus Dorsi', 'color': '4682B4'}, // SteelBlue
      {'name': 'Trapezius', 'color': '6A5ACD'}, // SlateBlue
      {'name': 'Rhomboids', 'color': '8A2BE2'}, // BlueViolet
      {'name': 'Deltoids (Front)', 'color': 'FFD700'}, // Gold
      {'name': 'Deltoids (Side)', 'color': 'FFA500'}, // Orange
      {'name': 'Deltoids (Rear)', 'color': 'FF8C00'}, // DarkOrange
      {'name': 'Biceps', 'color': 'FF4500'}, // OrangeRed
      {'name': 'Triceps', 'color': 'DC143C'}, // Crimson
      {'name': 'Forearms', 'color': '8B0000'}, // DarkRed
      {'name': 'Quadriceps', 'color': '32CD32'}, // LimeGreen
      {'name': 'Hamstrings', 'color': '228B22'}, // ForestGreen
      {'name': 'Glutes', 'color': '008000'}, // Green
      {'name': 'Calves', 'color': '006400'}, // DarkGreen
      {'name': 'Abdominals', 'color': '00FA9A'}, // MediumSpringGreen
      {'name': 'Obliques', 'color': '00FF7F'}, // SpringGreen
      {'name': 'Lower Back', 'color': '2E8B57'} // SeaGreen
    ];
    for (var initmuscle in initialMuscles) {
      batch.insert(
          muscle,
          MuscleCompanion(
            name: Value(initmuscle['name']),
            color: Value(initmuscle['color']),
          ));
    }
  }

  Future<void> insertInitialExerciseItems(Batch batch) async {
    List<Map<String, dynamic>> initialExerciseItems = [
      {'label': 'Push ups'}, // Tomato
      {'label': 'Pull ups'}, // SteelBlue
      {'label': 'Sit ups'}, // SeaGreen
    ];
    for (var initialExerciseItem in initialExerciseItems) {
      batch.insert(
          exerciseItem,
          ExerciseItemCompanion(
            label: Value(initialExerciseItem['label']),
          ));
    }
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await batch((batch) async {
            await insertInitialMuscles(batch);
            await insertInitialExerciseItems(batch);
          });
        },
      );
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'gym_planner.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
