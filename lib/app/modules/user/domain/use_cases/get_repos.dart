import 'package:dartz/dartz.dart';
import 'package:github_api/app/modules/user/domain/entities/repos_result.dart';
import 'package:github_api/app/modules/user/domain/exceptions/repos_exceptions.dart';

import '../repositories/repos_repository.dart';

abstract class IGetReposUser {
  Future<Either<ReposErros, List<ReposResult>?>>? call(String username);
}

class GetReposUser implements IGetReposUser {
  final IReposUserRepository repository;

  GetReposUser(this.repository);
  @override
  Future<Either<ReposErros, List<ReposResult>?>>? call(String username) async {
    if (username.isEmpty) {
      return Left(InvalidRepos());
    }
    final result = await repository.getRepos(username)!;
    return result;
  }
}
