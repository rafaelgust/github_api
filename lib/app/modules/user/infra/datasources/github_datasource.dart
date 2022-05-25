import '../models/repos_result_model.dart';
import '../models/user_result_model.dart';

abstract class IUserDataSource {
  Future<UserResultModel?>? apiUser(String username);
  Future<List<ReposResultModel>?>? apiRepos(String username);
}
