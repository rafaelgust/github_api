import 'dart:convert';

import '../../../../core/services/fetch_service.dart';

import '../../infra/datasources/github_datasource.dart';

import '../../domain/exceptions/repos_exceptions.dart';
import '../../domain/exceptions/user_exceptions.dart';

import '../../infra/models/repos_result_model.dart';
import '../../infra/models/user_result_model.dart';

class GithubDataSourcer implements IUserDataSource {
  final IFetchService service;

  GithubDataSourcer(this.service);
  @override
  Future<UserResultModel?>? apiUser(String username) async {
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

  @override
  Future<List<ReposResultModel>?>? apiRepos(String username) async {
    var response =
        await service.fetchGet('https://api.github.com/users/$username/repos');
    final result = response.data;

    if (response.statusCode == 200) {
      final List<ReposResultModel> list =
          await result.map((m) => ReposResultModel.fromJson(m)).toList();

      return list;
    } else {
      throw DataSourceReposError('statusCode != 200 => ${response.statusCode}');
    }
  }
}
