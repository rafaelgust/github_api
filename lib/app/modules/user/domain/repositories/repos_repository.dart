import 'package:dartz/dartz.dart';

import '../entities/repos_result.dart';
import '../exceptions/repos_exceptions.dart';

abstract class IReposUserRepository {
  Future<Either<ReposErros, List<ReposResult>?>>? getRepos(String username);
}
