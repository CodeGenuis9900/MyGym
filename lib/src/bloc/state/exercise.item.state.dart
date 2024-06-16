import '../../data/repositories/database.dart';

abstract class ExerciseItemState {}

class ExerciseItemLoading extends ExerciseItemState {}

class ExerciseItemLoaded extends ExerciseItemState {
  final List<ExerciseItemData> exerciseItems;
  ExerciseItemLoaded(this.exerciseItems);
}

class ExerciseItemError extends ExerciseItemState {}
