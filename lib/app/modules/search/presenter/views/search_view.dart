import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/services/debounce_service.dart';
import '../bloc/events/search_events.dart';
import '../bloc/search_bloc.dart';
import '../bloc/states/search_states.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final bloc = Modular.get<SearchBloc>();
  final Debounce _debounce = Debounce(const Duration(milliseconds: 800));

  @override
  void dispose() {
    _debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Modular.to.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => _debounce(() {
                  bloc.add(SearchInputEvent(value));
                }),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: bloc.stream,
                  builder: (context, snapshot) {
                    if (bloc.state is SearchInitialState) {
                      return const Center(
                        child: Text('Procure um usuario'),
                      );
                    }
                    if (bloc.state is SearchErrorState) {
                      return const Center(
                        child: Text('Campo vazio'),
                      );
                    }
                    if (bloc.state is SearchLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final list = (bloc.state as SearchSucessState).list;
                    return ListView.builder(
                      itemCount: list?.length,
                      itemBuilder: ((context, index) => InkWell(
                            onTap: () => Modular.to
                                .pushNamed('/user/${list?[index].username}'),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage('${list?[index].img}'),
                              ),
                              title: Text(
                                  '${list?[index].username} - ${list?[index].id}'),
                              subtitle: Text('${list?[index].url}'),
                            ),
                          )),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
