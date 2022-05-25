import 'package:flutter/material.dart';

import '../../domain/entities/result_search.dart';

class ListUser extends StatelessWidget {
  final SearchResult item;
  final VoidCallback goUser;
  const ListUser({super.key, required this.item, required this.goUser});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goUser(),
      child: ListTile(
        leading: Hero(
          tag: 'avatar@${item.username}',
          child: CircleAvatar(
            backgroundImage: NetworkImage(item.img),
          ),
        ),
        title: Text('${item.username} - ${item.id}'),
        subtitle: Text(item.url),
      ),
    );
  }
}
