import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final String username, name, email, company, bio, location, avatar;
  final int? followers, following, repos, gists;
  const UserHeader({
    super.key,
    required this.username,
    required this.name,
    required this.email,
    required this.company,
    required this.bio,
    required this.location,
    required this.avatar,
    required this.followers,
    required this.following,
    required this.repos,
    required this.gists,
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
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(avatar),
            backgroundColor: Colors.transparent,
          ),
        ),
        Text('@$username'),
        Text(name),
        Text(bio),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: $email'),
                  Text('Company: $company'),
                  Text('Location: $location'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Followers: $followers'),
                  Text('Following: $following'),
                  Text('Repos: $repos'),
                  Text('Gists: $gists'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
