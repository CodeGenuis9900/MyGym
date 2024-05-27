// States
abstract class WorkoutIdState {}

class WorkoutIdInitial extends WorkoutIdState {}

class WorkoutIdSelected extends WorkoutIdState {
  final int workoutId;

  WorkoutIdSelected(this.workoutId);
}