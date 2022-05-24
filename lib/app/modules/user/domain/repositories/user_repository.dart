import 'package:dartz/dartz.dart';

import '../entities/user_result.dart';
import '../exceptions/user_exceptions.dart';

abstract class IUserRepository {
  Future<Either<UserErros, UserResult>>? getUser(String username);
}
