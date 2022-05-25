import 'dart:async';

import 'package:flutter/material.dart';

class ListUserLoading extends StatefulWidget {
  const ListUserLoading({Key? key}) : super(key: key);

  @override
  State<ListUserLoading> createState() => _ListUserLoadingState();
}

class _ListUserLoadingState extends State<ListUserLoading> {
  late Timer _timer;
  var opacity = 0.5;

  _animatedLoading() {
    _timer = Timer.periodic(const Duration(seconds: 700), (timer) {
      setState(() {
        if (opacity == 0.0) {
          opacity = 1.0;
        } else {
          opacity = 0.0;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _animatedLoading();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      opacity: opacity,
      child: ListView.builder(
        itemCount: 20,
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
      ),
    );
  }
}
