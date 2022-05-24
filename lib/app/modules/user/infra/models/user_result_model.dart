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

  UserResultModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    name = json['name'];
    company = json['company'];
    location = json['location'];
    email = json['email'];
    bio = json['bio'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;
    data['name'] = name;
    data['company'] = company;
    data['location'] = location;
    data['email'] = email;
    data['bio'] = bio;
    data['public_repos'] = publicRepos;
    data['public_gists'] = publicGists;
    data['followers'] = followers;
    data['following'] = following;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
