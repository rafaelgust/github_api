import 'package:bloc/bloc.dart';

import '../../domain/use_cases/get_repos.dart';
import 'events/repos_events.dart';
import 'states/repos_states.dart';

class ReposListBloc extends Bloc<ReposEvents, ReposStates> {
  final IGetReposUser usecase;

  ReposListBloc(this.usecase) : super(ReposInitialState()) {
    on<GetReposEvent>((event, emit) => _mapEventToState(event, emit));
  }

  void _mapEventToState(GetReposEvent event, Emitter<ReposStates> emit) async {
    emit(ReposLoadingState());
    final result = await usecase(event.username);
    await Future.delayed(const Duration(seconds: 1));
    result!.fold(
      (l) => emit(ReposErrorState(l)),
      (r) => emit(ReposSucessState(r)),
    );
  }
}
