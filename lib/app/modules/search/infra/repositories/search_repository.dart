import 'package:dartz/dartz.dart';

import '../../domain/entities/result_search.dart';
import '../../domain/exceptions/exceptions.dart';
import '../../domain/repositories/search_repository.dart';

import '../datasources/search_datasource.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDataSource datasource;

  SearchRepository(this.datasource);

  @override
  Future<Either<SearchErros, List<SearchResult>?>>? search(
      String searchUserName) async {
    try {
      final result = await datasource.getUsers(searchUserName);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError(e.toString()));
    }
  }
}
