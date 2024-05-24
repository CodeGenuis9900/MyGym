abstract class WorkoutEvent {}

class LoadWorkouts extends WorkoutEvent {}

class AddWorkout extends WorkoutEvent {
  final String name;

  AddWorkout(this.name);
}
