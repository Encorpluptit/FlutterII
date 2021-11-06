import 'dart:async';

import 'package:movieapp/src/models/list_item_model.dart';
import 'package:movieapp/src/models/movie_detail_model.dart';
import 'package:movieapp/src/resources/my_movie_provider.dart';

// import 'package:demo_bloc/src/models/movie_detail_model.dart';
// import 'package:demo_bloc/src/models/movie_image_model.dart';

import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  final myMovieProvider = MyMovieProvider();
  // Future<MovieDetailModel> fetchMovieDetail(int movieId) => moviesApiProvider.fetchMovieDetail(movieId);
  //
  // Future<MovieImageModel> fetchMovieImages(int movieId) => moviesApiProvider.fetchMovieImages(movieId);

  Future<ListItemModel> fetchMovieList(String type) =>
      moviesApiProvider.fetchMovieList(type);
  Future<MovieDetailModel> fetchMovieDetails(String id) =>
      myMovieProvider.fetchMovieDetails(id);
}
