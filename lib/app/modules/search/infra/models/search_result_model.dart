import 'dart:convert';

import '../../domain/entities/result_search.dart';

class SearchResultModel extends SearchResult {
  SearchResultModel({
    required super.id,
    required super.url,
    required super.img,
    required super.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'avatar_url': img,
      'login': username,
    };
  }

  factory SearchResultModel.fromMap(Map<String, dynamic> map) {
    return SearchResultModel(
      id: map['id'] as int,
      url: map['url'] as String,
      img: map['avatar_url'] as String,
      username: map['login'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResultModel.fromJson(String source) =>
      SearchResultModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
