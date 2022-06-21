import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_riverpod/services/http_service.dart';

import '../models/movie.dart';
import 'api.dart';

class MoviesService {
  final GetIt getIt = GetIt.instance;
  late HttpService _http;

  MoviesService() {
    _http = getIt.get<HttpService>();
  }

  Future<List<Movie>?> getPopularMovies({int? page}) async {
    Response? _response = await _http.get(API.popularAPI, query: {
      'page': page,
    });
    if (_response!.statusCode == 200) {
      Map _data = _response.data;
      List<Movie>? _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movies;
    } else {
      throw Exception('Couldn\'t load popular movies.');
    }
  }
}
