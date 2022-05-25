import 'package:dartz/dartz.dart';

import '../../domain/entities/user_result.dart';
import '../../domain/exceptions/user_exceptions.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/github_datasource.dart';

class UserRepository implements IUserRepository {
  final IUserDataSource datasource;

  UserRepository(this.datasource);
  @override
  Future<Either<UserErros, UserResult>>? getUser(String username) async {
    try {
      final result = await datasource.apiUser(username);
      return Right(result!);
    } catch (e) {
      return Left(DataSourceUserError(e.toString()));
    }
  }
}
