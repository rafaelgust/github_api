import 'package:dartz/dartz.dart';

import '../entities/result_search.dart';
import '../exceptions/exceptions.dart';

abstract class ISearchRepository {
  Future<Either<SearchErros, List<SearchResult>?>>? search(
      String searchUserName);
}
