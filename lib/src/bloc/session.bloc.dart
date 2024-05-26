import 'package:bloc/bloc.dart';
import 'package:mygym/src/bloc/state/session.state.dart';
import 'package:mygym/src/data/repositories/database.dart';
import 'package:drift/drift.dart' as dr;
import 'event/session.event.dart';


class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final AppDatabase appDatabase;

  SessionBloc(this.appDatabase) : super(SessionsLoading()) {
    on<LoadSessions>(_onLoadSessions);
    // on<AddSession>(_onAddSession);
  }

  Future<void> _onLoadSessions(LoadSessions event, Emitter<SessionState> emit) async {
    try {
      final workouts = await appDatabase.allSessions;
      emit(SessionsLoaded(workouts));
    } catch (_) {
      emit(SessionsError());
    }
  }

  // Future<void> _onAddSession(AddSession event, Emitter<SessionState> emit) async {
  //   try {
  //     await appDatabase.addSession(SessionCompanion(name: dr.Value(event.name)));
  //     add(LoadSessions());
  //   } catch (_) {
  //     emit(SessionsError());
  //   }
  // }
}
