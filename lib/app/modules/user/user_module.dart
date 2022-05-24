import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/views/user_view.dart';

class UserModule extends Module {
  @override
  List<Bind> get binds => [];

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
