import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_riverpod/models/movie.dart';
import 'package:movies_riverpod/services/movies_service.dart';

import '../models/main_page_model.dart';

class MainPageController extends StateNotifier<MainPageModel> {
  MainPageController(MainPageModel state) : super(state) {
    getMovies();
  }

  final MoviesService _moviesService = GetIt.instance.get<MoviesService>();

  Future<void> getMovies() async {
    try {
      List<Movie>? _movies = [];
      state = MainPageModel(_movies, true);
      _movies = await (_moviesService.getPopularMovies(page: 1));

      state = MainPageModel(_movies, false);
    } catch (e) {
      print(e);
    }
  }
}
