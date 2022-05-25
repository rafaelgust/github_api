import 'package:flutter/material.dart';

import '../../domain/entities/repos_result.dart';

class RepoContent extends StatelessWidget {
  final ReposResult item;
  const RepoContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 500,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Text('${item.name}'),
              Text('${item.description}'),
              const Divider(),
            ],
          )),
    );
  }
}
