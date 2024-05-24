import 'package:bloc/bloc.dart';
import 'package:mygym/src/bloc/state/workout.state.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:drift/drift.dart' as dr;
import 'event/workout.event.dart';


class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final AppDatabase appDatabase;

  WorkoutBloc(this.appDatabase) : super(WorkoutsLoading()) {
    on<LoadWorkouts>(_onLoadWorkouts);
    on<AddWorkout>(_onAddWorkout);
  }

  Future<void> _onLoadWorkouts(LoadWorkouts event, Emitter<WorkoutState> emit) async {
    try {
      final workouts = await appDatabase.allWorkouts;
      emit(WorkoutsLoaded(workouts));
    } catch (_) {
      emit(WorkoutsError());
    }
  }

  Future<void> _onAddWorkout(AddWorkout event, Emitter<WorkoutState> emit) async {
    try {
      await appDatabase.addWorkout(WorkoutCompanion(name: dr.Value(event.name)));
      add(LoadWorkouts());
    } catch (_) {
      emit(WorkoutsError());
    }
  }
}
