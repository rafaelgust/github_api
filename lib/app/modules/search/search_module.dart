import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/views/search_view.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SearchView()),
      ];
}
