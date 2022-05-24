abstract class UserErros implements Exception {}

class InvalidUserError implements UserErros {}

class DataSourceUserError implements UserErros {
  final String? message;

  DataSourceUserError(this.message);
}
