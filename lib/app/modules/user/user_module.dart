import 'package:flutter_modular/flutter_modular.dart';

import 'domain/use_cases/get_repos.dart';
import 'external/datasources/github_datasource.dart';
import 'infra/repositories/repos_repository.dart';
import 'infra/repositories/user_repository.dart';
import 'domain/use_cases/get_user.dart';

import 'presenter/bloc/repos_bloc.dart';
import 'presenter/bloc/user_bloc.dart';

import 'presenter/views/user_view.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => GithubDataSourcer(i())),
        Bind.factory((i) => UserRepository(i())),
        Bind.factory((i) => GetUserData(i())),
        Bind.singleton<UserViewBloc>((i) => UserViewBloc(i()),
            onDispose: (bloc) => bloc.close()),
        Bind.factory((i) => ReposUserRepository(i())),
        Bind.factory((i) => GetReposUser(i())),
        Bind.singleton<ReposListBloc>((i) => ReposListBloc(i()),
            onDispose: (bloc) => bloc.close()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/:user',
          child: (context, args) => UserView(
            user: args.params['user'],
          ),
        )
      ];
}
