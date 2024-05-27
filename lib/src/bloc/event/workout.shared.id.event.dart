// Events
abstract class WorkoutIdEvent {}

class SetWorkoutId extends WorkoutIdEvent {
  final int workoutId;

  SetWorkoutId(this.workoutId);
}
