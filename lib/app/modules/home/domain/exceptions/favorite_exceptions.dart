abstract class FailureFavorite implements Exception {}

class EmptyFavorite implements FailureFavorite {}

class DataSourceError implements FailureFavorite {
  final String? message;

  DataSourceError(this.message);
}
