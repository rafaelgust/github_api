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
          child: Hero(
            tag: 'avatar@$username',
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(avatar),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '@$username',
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        bioPart(bio),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoPartString('Email', email),
                  infoPartString('Company', company),
                  infoPartString('Location', location),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoPartInt('Followers', followers),
                  infoPartInt('Following', following),
                  infoPartInt('Repos', repos),
                  infoPartInt('Gists', gists),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bioPart(bio) {
    return bio == 'null'
        ? const SizedBox.shrink()
        : Container(
            width: 300,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              bio,
              textAlign: TextAlign.center,
            ),
          );
  }

  Widget infoPartString(String part, String info) {
    return info == 'null'
        ? Row(
            children: [
              Text('$part: '),
              const Text(
                'hidden',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          )
        : Row(
            children: [
              Text('$part: '),
              Text(
                info,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          );
  }

  Widget infoPartInt(String part, int? info) {
    return Row(
      children: [
        Text('$part: '),
        Text(
          '$info',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
