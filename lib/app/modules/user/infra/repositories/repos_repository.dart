import 'package:dartz/dartz.dart';

import '../../domain/entities/repos_result.dart';
import '../../domain/exceptions/repos_exceptions.dart';
import '../../domain/repositories/repos_repository.dart';
import '../datasources/github_datasource.dart';

class ReposUserRepository implements IReposUserRepository {
  final IUserDataSource datasource;

  ReposUserRepository(this.datasource);

  @override
  Future<Either<ReposErros, List<ReposResult>?>>? getRepos(
      String username) async {
    try {
      final result = await datasource.apiRepos(username);
      return Right(result);
    } catch (e) {
      return Left(DataSourceReposError(e.toString()));
    }
  }
}
