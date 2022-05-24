import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../exceptions/user_exceptions.dart';

abstract class IUserRepository {
  Future<Either<UserErros, User>>? getUser(String username);
}
