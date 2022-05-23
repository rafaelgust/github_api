import 'package:bloc/bloc.dart';
import 'package:github_api/app/modules/search/domain/use_cases/search_user_name.dart';

import 'events/search_events.dart';
import 'states/search_states.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ISearchUserName usecase;

  SearchBloc(this.usecase) : super(SearchInitialState()) {
    on<SearchInputEvent>((event, emit) => _mapEventToState(event, emit));
  }

  void _mapEventToState(
      SearchInputEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    final result = await usecase(event.search);
    result!.fold(
      (l) => emit(SearchErrorState(l)),
      (r) => emit(SearchSucessState(r)),
    );
  }
}
