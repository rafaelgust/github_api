import 'dart:async';

import 'package:flutter/material.dart';

class RepoContentLoading extends StatefulWidget {
  const RepoContentLoading({super.key});

  @override
  State<RepoContentLoading> createState() => _RepoContentLoadingState();
}

class _RepoContentLoadingState extends State<RepoContentLoading> {
  late Timer _timer;
  var opacity = 0.5;

  _animatedLoading() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
            return Center(
              child: Container(
                width: 500,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(5.0),
              ),
            );
          }),
    );
  }
}
