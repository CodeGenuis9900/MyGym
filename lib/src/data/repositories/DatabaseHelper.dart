
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'SQLQueries.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'gym_planner.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(SQLQueries.createWorkoutsTable());
    batch.execute(SQLQueries.createExercisesTable());
    batch.execute(SQLQueries.createSessionsTable());
    batch.execute(SQLQueries.createMusclesTable());
    batch.execute(SQLQueries.createWorkoutExercisesTable());
    batch.execute(SQLQueries.createSessionMusclesTable());
    await batch.commit();
  }
  Future<int> insert(String table, Map<String, dynamic> data) async {
    Database db = await instance.database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> update(String table, Map<String, dynamic> data, String whereClause, List<dynamic> whereArgs) async {
    Database db = await instance.database;
    return await db.update(table, data, where: whereClause, whereArgs: whereArgs);
  }

  Future<int> delete(String table, String whereClause, List<dynamic> whereArgs) async {
    Database db = await instance.database;
    return await db.delete(table, where: whereClause, whereArgs: whereArgs);
  }

// Add methods for insert, update, delete, query operations
}