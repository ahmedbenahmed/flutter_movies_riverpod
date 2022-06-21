import 'package:dio/dio.dart';
import 'package:movies_riverpod/services/api.dart';

class HttpService {
  final Dio dio = Dio();

  Future<Response?> get(String path, {Map<String, dynamic>? query}) async {
    try {
      String url = '${API.BASE_API_URL}$path';
      Map<String, dynamic> query = {
        'api_key': API.API_KEY,
        'language': 'en-US',
      };
      if (query != null) {
        query.addAll(query);
      }
      return await dio.get(url, queryParameters: query);
    } on DioError catch (e) {
      print('DioError:$e');
    }
  }
}
