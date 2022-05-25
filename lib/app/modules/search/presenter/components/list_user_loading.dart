import 'package:flutter/material.dart';

class ListUserLoading extends StatefulWidget {
  const ListUserLoading({Key? key}) : super(key: key);

  @override
  State<ListUserLoading> createState() => _ListUserLoadingState();
}

class _ListUserLoadingState extends State<ListUserLoading> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
          ),
          title: Container(
            width: 100,
            height: 30,
            margin: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          subtitle: Container(
            width: 150,
            height: 20,
            margin: const EdgeInsets.all(2.0),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
