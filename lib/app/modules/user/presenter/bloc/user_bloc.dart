import 'package:bloc/bloc.dart';

import '../../domain/use_cases/get_user.dart';

import 'events/user_events.dart';
import 'states/user_states.dart';

class UserViewBloc extends Bloc<UserEvents, UserStates> {
  final IGetUserData usecase;

  UserViewBloc(this.usecase) : super(UserInitialState()) {
    on<GetUserEvent>((event, emit) => _mapEventToState(event, emit));
  }

  void _mapEventToState(GetUserEvent event, Emitter<UserStates> emit) async {
    emit(UserLoadingState());
    final result = await usecase(event.username);
    result!.fold(
      (l) => emit(UserErrorState(l)),
      (r) => emit(UserSucessState(r)),
    );
  }
}
