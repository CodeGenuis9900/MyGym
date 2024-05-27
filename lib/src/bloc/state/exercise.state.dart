import 'package:mygym/src/data/repositories/database.dart';

abstract class ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseLoaded extends ExerciseState {
  final List<ExerciseData> exercises;

  ExerciseLoaded(this.exercises);
}

class ExerciseError extends ExerciseState {}
