import '../../../domain/entities/user.dart';

abstract class FavoriteStates {}

class FavoriteIdleState extends FavoriteStates {}

class FavoriteLoadingState extends FavoriteStates {}

class FavoriteErrorState extends FavoriteStates {}

class FavoriteSucessState extends FavoriteStates {
  final List<User> list;

  FavoriteSucessState(this.list);
}
