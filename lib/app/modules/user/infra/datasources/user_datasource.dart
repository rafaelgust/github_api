import '../models/user_result_model.dart';

abstract class IUserDataSource {
  Future<UserResultModel?>? call(String username);
}
