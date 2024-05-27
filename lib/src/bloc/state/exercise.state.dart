import 'package:mygym/src/bloc/state/workout.state.dart';
import 'package:mygym/src/data/repositories/database.dart';

abstract class ExerciseState {}

class ExerciseLoaded extends WorkoutState {
  final List<ExerciseData> exercises;

  ExerciseLoaded(this.exercises);
}

class ExerciseError extends ExerciseState {}
