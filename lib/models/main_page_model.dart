import 'movie.dart';

class MainPageModel {
  final List<Movie>? movies;
  bool isLoading;

  MainPageModel(this.movies, this.isLoading);
}
