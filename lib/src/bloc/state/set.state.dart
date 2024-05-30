
import '../../data/repositories/database.dart';

abstract class SetState {}

class SetsLoading extends SetState {}

class SetsLoaded extends SetState {
  final List<SetWorkoutData> sessions;

  SetsLoaded(this.sessions);
}

class SetsError extends SetState {}
