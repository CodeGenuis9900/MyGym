import '../../data/repositories/database.dart';

abstract class SetState {}

class SetsLoading extends SetState {}

class SetsLoaded extends SetState {
  final List<SetWorkoutData> setsOfAWorkout;

  SetsLoaded(this.setsOfAWorkout);
}

class AddDefaultSets extends SetState {
  final int exerciseId;

  AddDefaultSets(this.exerciseId);

  @override
  List<Object?> get props => [exerciseId];
}

class SetAdded extends SetState {}

class SetsError extends SetState {}
