import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserFavorite extends StatelessWidget {
  final User user;
  final Function(String user) goToUser;
  const UserFavorite({Key? key, required this.user, required this.goToUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
              offset: Offset(3, 3),
            ),
          ]),
      child: InkWell(
        onTap: () => goToUser('${user.username}'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Hero(
                tag: 'avatar@${user.username}',
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage('${user.img}'),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user.name}'),
                Text('${user.username} - ${user.id}'),
                const Spacer(),
                Text('${user.url}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
