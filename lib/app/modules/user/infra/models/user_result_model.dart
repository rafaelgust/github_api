import 'dart:convert';

import '../../domain/entities/user_result.dart';

class UserResultModel extends UserResult {
  UserResultModel({
    required super.login,
    required super.id,
    required super.nodeId,
    required super.name,
    required super.email,
    required super.company,
    required super.avatarUrl,
    required super.bio,
    required super.location,
    required super.publicRepos,
    required super.publicGists,
    required super.followers,
    required super.following,
    required super.createdAt,
    required super.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'id': id,
      'node_id': nodeId,
      'name': name,
      'email': email,
      'company': company,
      'avatar_url': avatarUrl,
      'bio': bio,
      'location': location,
      'public_repos': publicRepos,
      'public_gists': publicGists,
      'followers': followers,
      'following': following,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory UserResultModel.fromMap(Map<String, dynamic> map) {
    return UserResultModel(
      login: map['login'] != null ? map['login'] as String : '',
      id: map['id'] != null ? map['id'] as int : null,
      nodeId: map['node_id'] != null ? map['node_id'] as String : '',
      name: map['name'] != null ? map['name'] as String : '',
      email: map['email'] != null ? map['email'] as String : '',
      company: map['company'] != null ? map['company'] as String : '',
      avatarUrl: map['avatar_url'] != null ? map['avatar_url'] as String : '',
      bio: map['bio'] != null ? map['bio'] as String : '',
      location: map['location'] != null ? map['location'] as String : '',
      publicRepos:
          map['public_repos'] != null ? map['public_repos'] as int : null,
      publicGists:
          map['public_gists'] != null ? map['public_gists'] as int : null,
      followers: map['followers'] != null ? map['followers'] as int : null,
      following: map['following'] != null ? map['following'] as int : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : '',
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResultModel.fromJson(String source) =>
      UserResultModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
