abstract class SessionEvent {}

class LoadSessions extends SessionEvent {}

class AddSession extends SessionEvent {
  final int workoutId;
  final DateTime startTime;
  final DateTime endTime;
  final String nameSession;
  AddSession(this.workoutId, this.startTime, this.endTime, this.nameSession);
}

class LoadSessionByWorkoutId extends SessionEvent {
  final int workoutId;

  LoadSessionByWorkoutId(this.workoutId);
}

class SearchSessions extends SessionEvent {
  final String query;

  SearchSessions(this.query);
}
