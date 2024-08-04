import 'package:bloc/bloc.dart';
import 'package:mygym/src/bloc/event/exercise.event.dart';
import 'package:mygym/src/bloc/event/set.event.dart';
import 'package:mygym/src/bloc/set.bloc.dart';
import 'package:mygym/src/bloc/state/exercise.state.dart';
import 'package:mygym/src/bloc/state/set.state.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:drift/drift.dart' as dr;
import 'package:mygym/src/data/repositories/exercise.dao.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final AppDatabase appDatabase;
  final SetBloc setBloc;
  ExerciseBloc(this.appDatabase, this.setBloc) : super(ExerciseLoading()) {
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
      final exerciseId = await appDatabase.addExercise(ExerciseCompanion.insert(
          workoutId: dr.Value(event.workoutId),
          exerciseItemId: dr.Value(event.exerciseItemId)));
      setBloc.add(AddDefaultSets(exerciseId) as SetEvent);
      add(LoadExerciseByWorkoutId(event.workoutId));
    } catch (_) {
      emit(ExerciseError());
    }
  }

  Future<void> _onLoadExerciseByWorkoutId(
      LoadExerciseByWorkoutId event, Emitter<ExerciseState> emit) async {
    try {
      final exercises =
          await appDatabase.getExercisesWithItemByWorkoutId(event.workoutId);
      emit(ExerciseWithItemLoaded(exercises));
    } catch (_) {
      emit(ExerciseError());
    }
  }
}
