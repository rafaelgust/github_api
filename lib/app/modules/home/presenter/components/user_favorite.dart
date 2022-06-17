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
      height: 150,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
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
                  backgroundImage: NetworkImage('${user.img}'),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user.username} - ${user.id}'),
                Text('${user.name}'),
                Spacer(),
                Text('${user.url}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
