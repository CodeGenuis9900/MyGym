import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart' as dr;
import 'package:mygym/src/bloc/state/set.state.dart';
import 'package:mygym/src/data/repositories/database.dart';

import 'event/set.event.dart';

class SetBloc extends Bloc<SetEvent, SetState> {
  final AppDatabase appDatabase;

  SetBloc(this.appDatabase) : super(SetsLoading()) {
    on<LoadSetByExerciseId>(_onLoadSetsByWorkoutId);
    on<LoadSets>(_onLoadSets);
    on<AddSet>(_onAddSet);
  }

  Future<void> _onLoadSets(LoadSets event, Emitter<SetState> emit) async {
    try {
      final workouts = await appDatabase.allSets;
      emit(SetsLoaded(workouts));
    } catch (_) {
      emit(SetsError());
    }
  }

  Future<void> _onAddSet(AddSet event, Emitter<SetState> emit) async {
    try {
      await appDatabase.addSets(
        SetWorkoutCompanion.insert(
            points: 20, weight: 20, type: 'w', setNumber: 1),
      );

      add(LoadSetByExerciseId(
          event.exerciseId)); // Reload sets after adding a new one
    } catch (_) {
      emit(SetsError());
    }
  }

  Future<void> _onLoadSetsByWorkoutId(
      LoadSetByExerciseId event, Emitter<SetState> emit) async {
    try {
      final sets = await appDatabase.getSetsByExerciseId(event.setId);
      emit(SetsLoaded(sets));
    } catch (_) {
      emit(SetsError());
    }
  }

  Future<void> _onAddDefaultSetWorkouts(
      AddDefaultSets event, Emitter<SetState> emit) async {
    try {
      emit(SetsLoading());

      // Add 4 default SetWorkout entries
      for (var i = 1; i <= 4; i++) {
        await appDatabase.addSets(
          SetWorkoutCompanion.insert(
            exerciseId: dr.Value(event.exerciseId),
            points: 0,
            weight: 0,
            type: '',
            setNumber: i,
          ),
        );
      }

      emit(SetAdded());
    } catch (_) {
      emit(SetsError());
    }
  }
}
