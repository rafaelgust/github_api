import '../../domain/entities/user.dart';

class UserModel implements User {
  @override
  int? id;
  @override
  String? url;
  @override
  String? img;
  @override
  String? username;
  @override
  String? name;

  UserModel({
    required this.id,
    required this.url,
    required this.img,
    required this.name,
    required this.username,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['html_url'];
    img = json['avatar_url'];
    name = json['name'];
    username = json['login'];
  }
}
