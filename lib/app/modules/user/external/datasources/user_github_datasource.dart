import '../../../../core/services/fetch_service.dart';

import '../../domain/exceptions/user_exceptions.dart';
import '../../infra/datasources/user_datasource.dart';
import '../../infra/models/user_result_model.dart';

class GithubUserDataSourcer implements IUserDataSource {
  final IFetchService service;

  GithubUserDataSourcer(this.service);
  @override
  Future<UserResultModel?>? call(String username) async {
    var response =
        await service.fetchGet('https://api.github.com/users/$username');
    final result = response.data;

    if (response.statusCode == 200) {
      final user = UserResultModel.fromJson(result);
      return user;
    } else {
      throw DataSourceUserError('statusCode != 200 => ${response.statusCode}');
    }
  }
}
