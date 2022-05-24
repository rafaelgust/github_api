abstract class UserEvents {
  final String username;
  UserEvents(this.username);
}

class GetUserEvent extends UserEvents {
  GetUserEvent(super.username);
}
