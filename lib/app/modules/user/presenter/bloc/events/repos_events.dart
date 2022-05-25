abstract class ReposEvents {
  final String username;
  ReposEvents(this.username);
}

class GetReposEvent extends ReposEvents {
  GetReposEvent(super.username);
}
