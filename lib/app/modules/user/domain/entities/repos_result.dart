class ReposResult {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  String? htmlUrl;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? pushedAt;
  String? language;
  String? defaultBranch;
  bool? archived;
  bool? disabled;
  bool? allowForking;
  bool? isTemplate;
  int? forksCount;
  int? watchersCount;
  int? stargazersCount;
  int? openIssuesCount;
  int? forks;
  int? openIssues;
  int? watchers;

  ReposResult({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.htmlUrl,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.forksCount,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.allowForking,
    this.isTemplate,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
  });
}
