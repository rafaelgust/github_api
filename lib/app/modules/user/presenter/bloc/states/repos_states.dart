import '../../../domain/entities/repos_result.dart';
import '../../../domain/exceptions/repos_exceptions.dart';

abstract class ReposStates {}

class ReposInitialState implements ReposStates {}

class ReposLoadingState implements ReposStates {}

class ReposSucessState implements ReposStates {
  final List<ReposResult>? list;

  ReposSucessState(this.list);
}

class ReposErrorState implements ReposStates {
  final ReposErros error;

  ReposErrorState(this.error);
}
