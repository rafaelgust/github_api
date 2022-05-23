import '../../../core/services/fetch_service.dart';

import '../domain/exceptions/exceptions.dart';
import '../infra/datasources/search_datasource.dart';
import '../infra/models/search_result_model.dart';

extension on String {
  usernameSpace() {
    return replaceAll(" ", "+");
  }
}

class GithubDataSource implements ISearchDataSource {
  final IFetchService service;

  GithubDataSource(this.service);

  @override
  Future<List<SearchResultModel>?>? getUsers(String searchUserName) async {
    var response = await service.fetchGet(
        'https://api.github.com/search/users?q=${searchUserName.usernameSpace()}');
    final result = response.data;

    if (response.statusCode == 200) {
      final list = (result["items"] as List)
          .map((m) => SearchResultModel.fromMap(m))
          .toList();

      return list;
    } else {
      throw DataSourceError('statusCode != 200 => ${response.statusCode}');
    }
  }
}
