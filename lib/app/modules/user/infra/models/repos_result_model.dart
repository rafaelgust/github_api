// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/repos_result.dart';

List<ReposResultModel> reposFromJson(String str) => List<ReposResultModel>.from(
    json.decode(str).map((x) => ReposResultModel.fromJson(x)));

class ReposResultModel extends ReposResult {
  ReposResultModel({
    required super.id,
    required super.nodeId,
    required super.name,
    required super.fullName,
    required super.htmlUrl,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
    required super.pushedAt,
    required super.stargazersCount,
    required super.watchersCount,
    required super.language,
    required super.forksCount,
    required super.archived,
    required super.disabled,
    required super.openIssuesCount,
    required super.allowForking,
    required super.isTemplate,
    required super.forks,
    required super.openIssues,
    required super.watchers,
    required super.defaultBranch,
  });

  factory ReposResultModel.fromJson(Map<String, dynamic> json) =>
      ReposResultModel(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        htmlUrl: json["html_url"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pushedAt: json["pushed_at"],
        language: json["language"],
        defaultBranch: json["default_branch"],
        archived: json["archived"],
        disabled: json["disabled"],
        allowForking: json["allow_forking"],
        isTemplate: json["is_template"],
        forksCount: json["forks_count"],
        watchersCount: json["watchers_count"],
        stargazersCount: json["stargazers_count"],
        openIssuesCount: json["open_issues_count"],
        forks: json["forks"],
        openIssues: json["open_issues"],
        watchers: json["watchers"],
      );
}
