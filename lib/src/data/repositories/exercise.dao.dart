import 'package:drift/drift.dart';

import '../models/exercise.with.item.dart';
import 'database.dart';

extension ExerciseDao on AppDatabase {
  Future<List<ExerciseWithItem>> getExercisesWithItemByWorkoutId(
      int workoutId) async {
    // Perform a join query between Exercise and ExerciseItem
    final query = select(exercise).join(
      [
        leftOuterJoin(
            exerciseItem, exercise.exerciseItemId.equalsExp(exerciseItem.id)),
      ],
    )..where(exercise.workoutId.equals(workoutId));

    // Map the results into ExerciseWithItem
    final rows = await query.get();

    return rows.map((row) {
      final exerciseData = row.readTable(exercise);
      final exerciseItemData = row.readTableOrNull(exerciseItem);

      return ExerciseWithItem(
        id: exerciseData.id,
        workoutId: exerciseData.workoutId,
        exerciseItem: exerciseItemData,
      );
    }).toList();
  }
}
