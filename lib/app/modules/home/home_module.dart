import 'package:flutter_modular/flutter_modular.dart';

import 'external/github_datasource.dart';
import 'infra/repositories/favorite_repository.dart';
import 'domain/use_cases/get_favorite.dart';

import 'presenter/bloc/favorite_bloc.dart';
import 'presenter/views/home_view.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => UserDataSourcerGitHub(i())),
        Bind.factory((i) => FavoriteRepository(i())),
        Bind.factory((i) => GetFavorite(i())),
        Bind.singleton<FavoriteBloc>((i) => FavoriteBloc(i()),
            onDispose: (value) => value.close()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomeView()),
      ];
}
