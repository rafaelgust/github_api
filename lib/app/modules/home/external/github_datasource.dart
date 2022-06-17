import '../../../core/services/fetch_service.dart';

import '../domain/exceptions/favorite_exceptions.dart';
import '../infra/datasources/user_datasource.dart';
import '../infra/models/user_model.dart';

class UserDataSourcerGitHub implements IUserDataSource {
  final IFetchService service;

  UserDataSourcerGitHub(this.service);
  @override
  Future<UserModel> apiUser(String? username) async {
    var response =
        await service.fetchGet('https://api.github.com/users/$username');
    final result = response.data;

    if (response.statusCode == 200) {
      final user = UserModel.fromJson(result);
      return user;
    } else {
      throw DataSourceError('statusCode != 200 => ${response.statusCode}');
    }
  }
}
