import 'package:dio/dio.dart';

abstract class IFetchService {
  Future<dynamic>? fetchGet(String? url);
}

class DioFetchService implements IFetchService {
  var dio = Dio();

  @override
  Future<dynamic>? fetchGet(String? url) async {
    try {
      final response = await dio.get(url!);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
