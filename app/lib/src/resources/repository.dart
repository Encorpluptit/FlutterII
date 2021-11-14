import 'dart:async';

import 'genre_api_provider.dart';
import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  final genresApiProvider = GenreApiProvider();

  Future<Object> fetchMovieList(String type) =>
      moviesApiProvider.fetchMovieList(type);
  Future<Object> fetchGenreList() => genresApiProvider.fetchGenreList();
  Future<Object> fetchMovieDetails(String id) =>
      moviesApiProvider.fetchMovieDetails(id);
  Future<Object> fetchMovieBySearch(String content) =>
      moviesApiProvider.fetchMovieBySearch(content);
  Future<Object> fetchGenres(List<String> ids) =>
      moviesApiProvider.fetchGenres(ids);
}
