import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  final String user;
  const UserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$user'),
      ),
    );
  }
}
