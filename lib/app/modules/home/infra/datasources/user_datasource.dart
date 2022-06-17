import '../models/user_model.dart';

abstract class IUserDataSource {
  Future<UserModel>? apiUser(String? username);
}
