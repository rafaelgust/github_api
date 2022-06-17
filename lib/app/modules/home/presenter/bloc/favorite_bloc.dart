import 'package:bloc/bloc.dart';

import '../../domain/use_cases/get_favorite.dart';

import 'events/favorite_events.dart';
import 'states/favorite_states.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteStates> {
  final IGetFavorite favorite;
  FavoriteBloc(this.favorite) : super(FavoriteIdleState()) {
    on<GetSingleFavorite>(resultSingle);
    on<GetListFavorites>(resultList);
  }

  resultSingle(GetSingleFavorite event, Emitter<FavoriteStates> emit) async {
    emit(FavoriteLoadingState());
  }

  resultList(GetListFavorites event, Emitter<FavoriteStates> emit) async {
    emit(FavoriteLoadingState());
    final list = await favorite.list(event.users!);
    list!.fold(
      (l) => emit(FavoriteErrorState()),
      (r) => emit(FavoriteSucessState(r)),
    );
  }
}
