import 'package:dartz/dartz.dart';

import '../entities/result_search.dart';
import '../exceptions/exceptions.dart';
import '../repositories/search_repository.dart';

abstract class ISearchUserName {
  Future<Either<SearchErros, List<SearchResult>?>>? call(String searchUserName);
}

class SearchUserName implements ISearchUserName {
  final ISearchRepository repository;

  SearchUserName(this.repository);

  @override
  Future<Either<SearchErros, List<SearchResult>?>>? call(
      String searchUserName) async {
    if (searchUserName.isEmpty) {
      return Left(InvalidTextError());
    }
    final result = await repository.search(searchUserName)!;
    return result;
  }
}
