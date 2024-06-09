abstract class ExerciseEvent {}

class LoadExercises extends ExerciseEvent {}

class AddExercise extends ExerciseEvent {
  final int workoutId;
  final int exerciseItemId;
  AddExercise(this.workoutId, this.exerciseItemId);
}

class LoadExerciseByWorkoutId extends ExerciseEvent {
  final int workoutId;
  LoadExerciseByWorkoutId(this.workoutId);
}

class SearchExercises extends ExerciseEvent {
  final String query;
  SearchExercises(this.query);
}
