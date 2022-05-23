abstract class SearchEvent {
  final String search;

  SearchEvent(this.search);
}

class SearchInputEvent extends SearchEvent {
  SearchInputEvent(super.search);
}
