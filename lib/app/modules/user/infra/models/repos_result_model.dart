// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/repos_result.dart';

class ReposResultModel extends ReposResult {
  ReposResultModel({
    super.id,
    super.nodeId,
    super.name,
    super.fullName,
    super.htmlUrl,
    super.description,
    super.createdAt,
    super.updatedAt,
    super.pushedAt,
    super.stargazersCount,
    super.watchersCount,
    super.language,
    super.forksCount,
    super.archived,
    super.disabled,
    super.openIssuesCount,
    super.allowForking,
    super.isTemplate,
    super.forks,
    super.openIssues,
    super.watchers,
    super.defaultBranch,
  });

  factory ReposResultModel.fromMap(Map<String, dynamic> map) {
    return ReposResultModel(
      id: map['id'] != null ? map['id'] as int : 0,
      nodeId: map['node_id'] != null ? map['node_id'] as String : '',
      name: map['name'] != null ? map['name'] as String : '',
      fullName: map['full_name'] != null ? map['full_name'] as String : '',
      htmlUrl: map['html_url'] != null ? map['html_url'] as String : '',
      description:
          map['description'] != null ? map['description'] as String : '',
      createdAt: map['created_at'] != null ? map['created_at'] as String : '',
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : '',
      pushedAt: map['pushed_at'] != null ? map['pushed_at'] as String : '',
      language: map['language'] != null ? map['language'] as String : '',
      defaultBranch:
          map['default_branch'] != null ? map['default_branch'] as String : '',
      archived: map['archived'] != null ? map['archived'] as bool : false,
      disabled: map['disabled'] != null ? map['disabled'] as bool : false,
      allowForking:
          map['allow_forking'] != null ? map['allow_forking'] as bool : false,
      isTemplate:
          map['is_template'] != null ? map['is_template'] as bool : false,
      forksCount: map['forks_count'] != null ? map['forks_count'] as int : 0,
      watchersCount:
          map['watchers_count'] != null ? map['watchers_count'] as int : 0,
      stargazersCount:
          map['stargazers_count'] != null ? map['stargazers_count'] as int : 0,
      openIssuesCount: map['open_issues_count'] != null
          ? map['open_issues_count'] as int
          : 0,
      forks: map['forks'] != null ? map['forks'] as int : 0,
      openIssues: map['open_issues'] != null ? map['open_issues'] as int : 0,
      watchers: map['watchers'] != null ? map['watchers'] as int : 0,
    );
  }

  factory ReposResultModel.fromJson(String source) =>
      ReposResultModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
