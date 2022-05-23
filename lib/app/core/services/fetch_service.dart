import 'package:dio/dio.dart';

abstract class IFetchService {
  Future<dynamic>? fetchGet(String? url);
}

class DioFetchService implements IFetchService {
  var dio = Dio();

  @override
  Future<dynamic>? fetchGet(String? url) async {
    final response = await dio.get(url!);
    var result = response;
    if (response.statusCode == 200) {
      return result;
    } else {
      return null;
    }
  }
}
