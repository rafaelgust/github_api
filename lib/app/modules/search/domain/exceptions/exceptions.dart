abstract class SearchErros implements Exception {}

class InvalidTextError implements SearchErros {}

class DataSourceError implements SearchErros {
  final String? message;

  DataSourceError(this.message);
}
