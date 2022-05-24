import 'package:dartz/dartz.dart';

import '../entities/user_result.dart';
import '../exceptions/user_exceptions.dart';
import '../repositories/user_repository.dart';

abstract class IGetUserData {
  Future<Either<UserErros, UserResult>>? call(String username);
}

class GetUserData implements IGetUserData {
  final IUserRepository repository;

  GetUserData(this.repository);
  @override
  Future<Either<UserErros, UserResult>>? call(String username) async {
    if (username.isEmpty) {
      return Left(InvalidUserError());
    }
    final result = await repository.getUser(username)!;
    return result;
  }
}
