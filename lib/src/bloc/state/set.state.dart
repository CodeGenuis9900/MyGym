
import '../../data/repositories/database.dart';

abstract class SetState {}

class SetsLoading extends SetState {}

class SetsLoaded extends SetState {
  final List<SetWorkoutData> setsOfAWorkout;

  SetsLoaded(this.setsOfAWorkout);
}

class SetsError extends SetState {}
