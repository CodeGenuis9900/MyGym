import 'package:bloc/bloc.dart';
import 'package:mygym/src/bloc/event/exercise.event.dart';
import 'package:mygym/src/bloc/state/exercise.state.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:drift/drift.dart' as dr;

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final AppDatabase appDatabase;
  ExerciseBloc(this.appDatabase) : super(ExerciseLoading()) {
    on<LoadExerciseByWorkoutId>(_onLoadExerciseByWorkoutId);
    on<LoadExercises>(_onLoadExercises);
    on<AddExercise>(_onAddExercise);
  }
  Future<void> _onLoadExercises(
      LoadExercises event, Emitter<ExerciseState> emit) async {
    try {
      final exercises = await appDatabase.allExercises;
      emit(ExerciseLoaded(exercises));
    } catch (_) {
      emit(ExerciseError());
    }
  }

  Future<void> _onAddExercise(
      AddExercise event, Emitter<ExerciseState> emit) async {
    try {
      await appDatabase.addExercise(ExerciseCompanion.insert(
          // repetition: event.repetitions,
          // points: event.points,
          workoutId: dr.Value(event.workoutId),
          exerciseItemId: dr.Value(event.exerciseItemId)));
      add(LoadExerciseByWorkoutId(event.workoutId));
    } catch (_) {
      emit(ExerciseError());
    }
  }

  Future<void> _onLoadExerciseByWorkoutId(
      LoadExerciseByWorkoutId event, Emitter<ExerciseState> emit) async {
    try {
      final exercises =
          await appDatabase.getExercisesByWorkoutId(event.workoutId);
      emit(ExerciseLoaded(exercises));
    } catch (_) {
      emit(ExerciseError());
    }
  }
}
