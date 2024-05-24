
import '../../data/repositories/database.dart';

abstract class WorkoutState {}

class WorkoutsLoading extends WorkoutState {}

class WorkoutsLoaded extends WorkoutState {
  final List<WorkoutData> workouts;

  WorkoutsLoaded(this.workouts);
}

class WorkoutsError extends WorkoutState {}
