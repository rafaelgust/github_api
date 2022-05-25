abstract class ReposErros implements Exception {}

class InvalidRepos implements ReposErros {}

class DataSourceReposError implements ReposErros {
  final String? message;

  DataSourceReposError(this.message);
}
