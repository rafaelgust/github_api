import 'package:flutter_modular/flutter_modular.dart';

import 'external/github_datasource.dart';
import 'infra/repositories/search_repository.dart';
import 'domain/use_cases/search_user_name.dart';

import 'presenter/bloc/search_bloc.dart';
import 'presenter/views/search_view.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => GithubDataSource(i())),
        Bind.factory((i) => SearchRepository(i())),
        Bind.factory((i) => SearchUserName(i())),
        Bind.singleton<SearchBloc>((i) => SearchBloc(i()),
            onDispose: (bloc) => bloc.close()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SearchView()),
      ];
}
