part of 'movie_search_bloc.dart';

abstract class MovieSearchState {
  const MovieSearchState();
}

class MovieSearchLoading extends MovieSearchState {
  MovieSearchLoading();
}

class MovieSearchWaiting extends MovieSearchState {
  MovieSearchWaiting();
}

class MovieSearchLoadedSuccess extends MovieSearchState {
  final List<Movie> movies;

  const MovieSearchLoadedSuccess([this.movies = const []]);
}

class MovieSearchLoadedFailure extends MovieSearchState {
  String cause = "";

  MovieSearchLoadedFailure(this.cause);
}

class MovieSearchClickOnDetailsSuccess extends MovieSearchState {
  final String id;

  const MovieSearchClickOnDetailsSuccess(this.id);
}
