abstract class SetEvent {}

class LoadSets extends SetEvent {}


class AddSet extends SetEvent {
  final int exerciseId;
  final int points;
  final int weight;
  final int setNumber;
  final String type;
  AddSet(this.exerciseId, this.points, this.weight, this.setNumber, this.type);
}

class LoadSetByExerciseId extends SetEvent {
  final int setId;
  LoadSetByExerciseId(this.setId);
}

