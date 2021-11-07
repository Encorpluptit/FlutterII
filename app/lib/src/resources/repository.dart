import 'dart:async';
import 'package:movieapp/src/models/list_item_model.dart';
import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<Object> fetchMovieList(String type) =>
      moviesApiProvider.fetchMovieList(type);
}
