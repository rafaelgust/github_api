import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/exceptions/favorite_exceptions.dart';
import '../../domain/repositories/favorite_repository.dart';
import '../datasources/user_datasource.dart';
import '../models/user_model.dart';

class FavoriteRepository implements IFavoriteRepository {
  final IUserDataSource datasource;

  FavoriteRepository(this.datasource);
  @override
  Future<Either<FailureFavorite, User>?>? getUser(String? username) async {
    try {
      final result = await datasource.apiUser(username);
      return Right(result!);
    } catch (e) {
      return Left(DataSourceError(e.toString()));
    }
  }

  @override
  Future<Either<FailureFavorite, List<User>>?>? getListUser(
      List<String> users) async {
    List<User> list = [];
    try {
      for (var user in users) {
        UserModel item = await datasource.apiUser(user)!;
        list.add(item);
      }

      return Right(list);
    } catch (e) {
      return Left(DataSourceError(e.toString()));
    }
  }
}
