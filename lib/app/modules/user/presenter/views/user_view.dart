import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_api/app/modules/user/presenter/bloc/events/user_events.dart';

import '../bloc/states/user_states.dart';
import '../bloc/user_bloc.dart';

class UserView extends StatefulWidget {
  final String user;
  const UserView({super.key, required this.user});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final bloc = Modular.get<UserViewBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(GetUserEvent(widget.user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user),
      ),
      body: StreamBuilder(
          stream: bloc.stream,
          builder: (context, snapshot) {
            if (bloc.state is UserInitialState) {
              return const Center(
                child: Text('Procure um usuario'),
              );
            }
            if (bloc.state is UserErrorState) {
              return const Center(
                child: Text('Campo vazio'),
              );
            }
            if (bloc.state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final user = (bloc.state as UserSucessState).list;
            return Text('${user?.name}');
          }),
    );
  }
}
