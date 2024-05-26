abstract class SessionEvent {}

class LoadSessions extends SessionEvent {}

class AddSession extends SessionEvent {
  final String name;

  AddSession(this.name);
}
class SearchSessions extends SessionEvent {
  final String query;

  SearchSessions(this.query);

}