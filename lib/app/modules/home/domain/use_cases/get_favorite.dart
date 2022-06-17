import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../exceptions/favorite_exceptions.dart';
import '../repositories/favorite_repository.dart';

abstract class IGetFavorite {
  Future<Either<FailureFavorite, User>?>? single(String? username);
  Future<Either<FailureFavorite, List<User>>?>? list(List<String> users);
}

class GetFavorite implements IGetFavorite {
  final IFavoriteRepository repository;

  GetFavorite(this.repository);
  @override
  Future<Either<FailureFavorite, User>?>? single(String? username) async {
    if (username!.isEmpty) {
      return Left(EmptyFavorite());
    }

    final result = repository.getUser(username);
    return result;
  }

  @override
  Future<Either<FailureFavorite, List<User>>?>? list(List<String> users) async {
    if (users.isEmpty) {
      return Left(EmptyFavorite());
    }

    final result = repository.getListUser(users);
    return result;
  }
}
