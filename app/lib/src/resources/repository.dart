import 'dart:async';

import 'genre_api_provider.dart';
import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  final genresApiProvider = GenreApiProvider();

  Future<Object> fetchMovieList(String type) =>
      moviesApiProvider.fetchMovieList(type);
  Future<Object> fetchGenreList() => genresApiProvider.fetchGenreList();
  //TODO
  Future<Object> fetchMovieDetails(String id) =>
      moviesApiProvider.fetchMovieList(id);
}
