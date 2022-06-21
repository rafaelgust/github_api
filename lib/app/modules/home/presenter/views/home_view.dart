import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/home/presenter/bloc/states/favorite_states.dart';

import '../bloc/events/favorite_events.dart';
import '../bloc/favorite_bloc.dart';
import '../components/user_favorite.dart';
import '../components/user_search.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final bloc = Modular.get<FavoriteBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetListFavorites(['rafaelgust', 'flutter', 'google']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              UserSearch(
                goToSearch: (search) => Modular.to.pushNamed('/search/$search'),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: StreamBuilder(
                  stream: bloc.stream,
                  builder: (context, snapshot) {
                    if (bloc.state is FavoriteIdleState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (bloc.state is FavoriteErrorState) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }
                    if (bloc.state is FavoriteLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final list = (bloc.state as FavoriteSucessState).list;

                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return UserFavorite(
                          user: list[index],
                          goToUser: (user) =>
                              Modular.to.pushNamed('/user/$user'),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
