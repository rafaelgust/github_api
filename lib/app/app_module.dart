import 'package:flutter_modular/flutter_modular.dart';

import 'core/services/fetch_service.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(((i) => DioFetchService())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
        /*  ModuleRoute('/auth', module: AuthModule()),
        ModuleRoute('/search', module: SearchModule()), */
      ];
}
