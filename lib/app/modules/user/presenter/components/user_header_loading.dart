import 'package:flutter/material.dart';

class UserHeaderLoading extends StatelessWidget {
  const UserHeaderLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.only(bottom: 10.0),
          child: const CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.grey,
          ),
        ),
        Container(
          width: 120,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoBar(),
                  infoBar(),
                  infoBar(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoBar(),
                  infoBar(),
                  infoBar(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget infoBar() {
    return Container(
      width: 100,
      height: 20,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 2.0),
    );
  }
}
