import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/user/presenter/bloc/events/repos_events.dart';

import '../bloc/events/user_events.dart';
import '../bloc/repos_bloc.dart';
import '../bloc/states/repos_states.dart';
import '../bloc/states/user_states.dart';
import '../bloc/user_bloc.dart';
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
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: bloc.stream,
                builder: (context, snapshot) {
                  if (bloc.state is UserInitialState) {
                    return const Center(
                      child: Text('Initial'),
                    );
                  }
                  if (bloc.state is UserErrorState) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  if (bloc.state is UserLoadingState) {
                    return const UserHeaderLoading();
                  }
                  final user = (bloc.state as UserSucessState).data;
                  return UserHeader(
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
                  );
                }),
            const Divider(),
            StreamBuilder(
                stream: blocRepos.stream,
                builder: (context, snapshot) {
                  if (blocRepos.state is ReposInitialState) {
                    return const Center(
                      child: Text('initial'),
                    );
                  }
                  if (blocRepos.state is ReposErrorState) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  if (blocRepos.state is ReposLoadingState) {
                    return const Center(
                      child: Text('Load'),
                    );
                  }
                  final list = (blocRepos.state as ReposSucessState).list;
                  return ListView.builder(
                    itemCount: list?.length,
                    itemBuilder: (context, index) {
                      return Text('${list?[index].name}');
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
