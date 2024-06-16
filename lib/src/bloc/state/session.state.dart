import '../../data/repositories/database.dart';

abstract class SessionState {}

class SessionsLoading extends SessionState {}

class SessionsLoaded extends SessionState {
  final List<SessionData> sessions;

  SessionsLoaded(this.sessions);
}

class SessionsError extends SessionState {}
