import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/services/debounce_service.dart';

import '../bloc/events/search_events.dart';
import '../bloc/search_bloc.dart';
import '../bloc/states/search_states.dart';
import '../components/list_user.dart';
import '../components/list_user_loading.dart';

class SearchView extends StatefulWidget {
  final String search;
  const SearchView({super.key, required this.search});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final bloc = Modular.get<SearchBloc>();
  final _searchController = TextEditingController();
  final Debounce _debounce = Debounce(const Duration(milliseconds: 800));

  @override
  void initState() {
    super.initState();
    _searchController.text = Uri.decodeFull(widget.search);
    bloc.add(SearchInputEvent(_searchController.text));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Modular.to.pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => _debounce(() {
                        bloc.add(SearchInputEvent(value));
                      }),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: bloc.stream,
                  builder: (context, snapshot) {
                    if (bloc.state is SearchInitialState) {
                      return const SizedBox.shrink();
                    }
                    if (bloc.state is SearchErrorState) {
                      return const Center(
                        child: Text('Ops'),
                      );
                    }
                    if (bloc.state is SearchLoadingState) {
                      return const Align(
                        alignment: Alignment.topLeft,
                        child: ListUserLoading(),
                      );
                    }
                    final list = (bloc.state as SearchSucessState).list;
                    return ListView.builder(
                      itemCount: list?.length,
                      itemBuilder: ((context, index) => ListUser(
                            item: list![index],
                            goUser: () => Modular.to
                                .pushNamed('/user/${list[index].username}'),
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
