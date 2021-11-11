import 'dart:async';
import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<Object> fetchMovieList(String type) =>
      moviesApiProvider.fetchMovieList(type);
  Future<Object> fetchMovieDetails(String id) =>
      moviesApiProvider.fetchMovieDetails(id);
}
