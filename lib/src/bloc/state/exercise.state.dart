import 'package:mygym/src/data/repositories/database.dart';

import '../../data/models/exercise.with.item.dart';

abstract class ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseLoaded extends ExerciseState {
  final List<ExerciseData> exercises;

  ExerciseLoaded(this.exercises);
}

class ExerciseWithItemLoaded extends ExerciseState {
  final List<ExerciseWithItem> exercisesWithItems;

  ExerciseWithItemLoaded(this.exercisesWithItems);
}

class ExerciseError extends ExerciseState {}
