import 'dart:async';
import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<Object> fetchMovieList(String type) =>
      moviesApiProvider.fetchMovieList(type);
  //TODO
  Future<Object> fetchMovieDetails(String id) =>
      moviesApiProvider.fetchMovieList(id);
}
