abstract class WorkoutEvent {}

class LoadWorkouts extends WorkoutEvent {}

class AddWorkout extends WorkoutEvent {
  final String name;

  AddWorkout(this.name);
}
class SearchWorkouts extends WorkoutEvent {
  final String query;

  SearchWorkouts(this.query);

}