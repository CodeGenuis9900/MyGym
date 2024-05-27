import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygym/src/bloc/state/workout.shared.id.state.dart';

import 'event/workout.shared.id.event.dart';

// Bloc
class WorkoutIdBloc extends Bloc<WorkoutIdEvent, WorkoutIdState> {
  WorkoutIdBloc() : super(WorkoutIdInitial()) {
    on<SetWorkoutId>((event, emit) {
      emit(WorkoutIdSelected(event.workoutId));
    });
  }
}
