import 'package:flutter_modular/flutter_modular.dart';

import 'external/datasources/user_github_datasource.dart';
import 'infra/repositories/user_repository.dart';
import 'domain/use_cases/get_user.dart';

import 'presenter/bloc/user_bloc.dart';
import 'presenter/views/user_view.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => GithubUserDataSourcer(i())),
        Bind.factory((i) => UserRepository(i())),
        Bind.factory((i) => GetUserData(i())),
        Bind.singleton<UserViewBloc>((i) => UserViewBloc(i()),
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
