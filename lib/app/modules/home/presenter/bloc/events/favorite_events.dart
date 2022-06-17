abstract class FavoriteEvents {}

class GetSingleFavorite extends FavoriteEvents {
  final String? username;

  GetSingleFavorite(this.username);
}

class GetListFavorites extends FavoriteEvents {
  final List<String>? users;

  GetListFavorites(this.users);
}
