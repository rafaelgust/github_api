import '../../../domain/entities/result_search.dart';
import '../../../domain/exceptions/exceptions.dart';

abstract class SearchState {}

class SearchInitialState implements SearchState {}

class SearchLoadingState implements SearchState {}

class SearchSucessState implements SearchState {
  final List<SearchResult>? list;

  SearchSucessState(this.list);
}

class SearchErrorState implements SearchState {
  final SearchErros error;

  SearchErrorState(this.error);
}
