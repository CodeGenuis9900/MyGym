import 'package:bloc/bloc.dart';
import 'package:mygym/src/bloc/state/session.state.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:drift/drift.dart' as dr;
import 'event/session.event.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final AppDatabase appDatabase;

  SessionBloc(this.appDatabase) : super(SessionsLoading()) {
    on<LoadSessionByWorkoutId>(_onLoadSessionsByWorkoutId);
    on<LoadSessions>(_onLoadSessions);
    on<AddSession>(_onAddSession);
  }

  Future<void> _onLoadSessions(
      LoadSessions event, Emitter<SessionState> emit) async {
    try {
      final workouts = await appDatabase.allSessions;
      emit(SessionsLoaded(workouts));
    } catch (_) {
      emit(SessionsError());
    }
  }

  Future<void> _onAddSession(
      AddSession event, Emitter<SessionState> emit) async {
    try {
      await appDatabase.addSession(
        SessionCompanion.insert(
            workoutId: dr.Value(event.workoutId),
            startTimeSession: event.startTime,
            endTimeSession: event.endTime),
      );

      add(LoadSessionByWorkoutId(
          event.workoutId)); // Reload sessions after adding a new one
    } catch (_) {
      emit(SessionsError());
    }
  }

  Future<void> _onLoadSessionsByWorkoutId(
      LoadSessionByWorkoutId event, Emitter<SessionState> emit) async {
    try {
      final sessions =
          await appDatabase.getSessionsByWorkoutId(event.workoutId);
      emit(SessionsLoaded(sessions));
    } catch (_) {
      emit(SessionsError());
    }
  }
  //TODO:to remove
  // Future<void> _onAddSession(AddSession event, Emitter<SessionState> emit) async {
  //   try {
  //     await appDatabase.addSession(SessionCompanion(name: dr.Value(event.name)));
  //     add(LoadSessions());
  //   } catch (_) {
  //     emit(SessionsError());
  //   }
  // }
}
