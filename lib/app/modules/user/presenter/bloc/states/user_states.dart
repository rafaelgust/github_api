import '../../../domain/entities/user_result.dart';
import '../../../domain/exceptions/user_exceptions.dart';

abstract class UserStates {}

class UserInitialState implements UserStates {}

class UserLoadingState implements UserStates {}

class UserSucessState implements UserStates {
  final UserResult? data;

  UserSucessState(this.data);
}

class UserErrorState implements UserStates {
  final UserErros error;

  UserErrorState(this.error);
}
