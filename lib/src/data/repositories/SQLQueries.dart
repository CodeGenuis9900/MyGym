class SQLQueries {
  static final SQLQueries instance = SQLQueries._privateConstructor();

  SQLQueries._privateConstructor();

  static String createWorkoutsTable() {
    return '''
      CREATE TABLE workouts (
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        muscle_group TEXT,
        equipment TEXT
      )
    ''';
  }
  static String getAllWorkoutsWithMuscleColorsQuery() {
    return '''
      SELECT workouts.name AS workout_name, workouts.numberOfExercises AS number_of_exercises, muscles.color AS muscle_color
      FROM workouts
      LEFT JOIN workout_exercises ON workouts.id = workout_exercises.workout_id
      LEFT JOIN exercises ON workout_exercises.exercise_id = exercises.id
      LEFT JOIN muscles ON exercises.muscle_id = muscles.id;
    ''';
  }
  static String createExercisesTable() {
    return '''
      CREATE TABLE exercises (
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT
      )
    ''';
  }

  static String createSessionsTable() {
    return '''
      CREATE TABLE sessions (
        id INTEGER PRIMARY KEY,
        workout_id INTEGER,
        date TEXT,
        notes TEXT,
        FOREIGN KEY (workout_id) REFERENCES workouts(id)
      )
    ''';
  }

  static String createMusclesTable() {
    return '''
      CREATE TABLE muscles (
        id INTEGER PRIMARY KEY,
        name TEXT
        color TEXT
      )
    ''';
  }

  static String createWorkoutExercisesTable() {
    return '''
      CREATE TABLE workout_exercises (
        workout_id INTEGER,
        exercise_id INTEGER,
        FOREIGN KEY (workout_id) REFERENCES workouts(id),
        FOREIGN KEY (exercise_id) REFERENCES exercises(id),
        PRIMARY KEY (workout_id, exercise_id)
      )
    ''';
  }

  static String createSessionMusclesTable() {
    return '''
      CREATE TABLE session_muscles (
        session_id INTEGER,
        muscle_id INTEGER,
        FOREIGN KEY (session_id) REFERENCES sessions(id),
        FOREIGN KEY (muscle_id) REFERENCES muscles(id),
        PRIMARY KEY (session_id, muscle_id)
      )
    ''';
  }
}
