import '../repositories/database.dart';

class ExerciseWithItem {
  final int id;
  final int? workoutId;
  final ExerciseItemData? exerciseItem;

  ExerciseWithItem({
    required this.id,
    this.workoutId,
    this.exerciseItem,
  });
}
