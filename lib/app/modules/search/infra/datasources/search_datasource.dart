import '../models/search_result_model.dart';

abstract class ISearchDataSource {
  Future<List<SearchResultModel>?>? getUsers(String searchUserName);
}
