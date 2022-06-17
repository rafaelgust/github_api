import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../exceptions/favorite_exceptions.dart';

abstract class IFavoriteRepository {
  Future<Either<FailureFavorite, User>?>? getUser(String? username);
  Future<Either<FailureFavorite, List<User>>?>? getListUser(List<String> users);
}
