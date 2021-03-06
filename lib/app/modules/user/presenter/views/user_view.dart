import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/user/presenter/bloc/events/repos_events.dart';

import '../bloc/events/user_events.dart';
import '../bloc/repos_bloc.dart';
import '../bloc/states/repos_states.dart';
import '../bloc/states/user_states.dart';
import '../bloc/user_bloc.dart';
import '../components/repo_content.dart';
import '../components/repo_content_loading.dart';
import '../components/user_header.dart';
import '../components/user_header_loading.dart';

class UserView extends StatefulWidget {
  final String user;
  const UserView({super.key, required this.user});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final bloc = Modular.get<UserViewBloc>();
  final blocRepos = Modular.get<ReposListBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetUserEvent(widget.user));
    blocRepos.add(GetReposEvent(widget.user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 430.0,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () => Modular.to.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: StreamBuilder(
                    stream: bloc.stream,
                    builder: (context, snapshot) {
                      if (bloc.state is UserInitialState ||
                          bloc.state is UserLoadingState) {
                        return const UserHeaderLoading();
                      }
                      if (bloc.state is UserErrorState) {
                        return const Center(
                          child: Text('Error'),
                        );
                      }

                      final user = (bloc.state as UserSucessState).data;
                      return Center(
                        child: UserHeader(
                          avatar: '${user?.avatarUrl}',
                          username: '${user?.login}',
                          name: '${user?.name}',
                          email: '${user?.email}',
                          company: '${user?.company}',
                          location: '${user?.location}',
                          bio: '${user?.bio}',
                          followers: user?.followers,
                          following: user?.following,
                          repos: user?.publicRepos,
                          gists: user?.publicGists,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            StreamBuilder(
              stream: blocRepos.stream,
              builder: (context, snapshot) {
                if (blocRepos.state is ReposInitialState ||
                    blocRepos.state is ReposLoadingState) {
                  return const RepoContentLoading();
                }
                if (blocRepos.state is ReposErrorState) {
                  return const Center(
                    child: Text('Error'),
                  );
                }

                final list = (blocRepos.state as ReposSucessState).list;

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: list?.length,
                    (context, index) => RepoContent(item: list![index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
