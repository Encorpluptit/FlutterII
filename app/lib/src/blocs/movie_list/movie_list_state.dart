part of 'movie_list_bloc.dart';

abstract class MovieListState {
  const MovieListState();

  List<Object> get props => [];
}

class MovieListLoading extends MovieListState {
  MovieListLoading();
}

class MovieListLoadedSuccess extends MovieListState {
  final List<Movie> movies;

  const MovieListLoadedSuccess([this.movies = const []]);
}

class MovieListLoadedFailure extends MovieListState {}

class MovieListClickOnDetailsSuccess extends MovieListState {
  final String id;

  const MovieListClickOnDetailsSuccess(this.id);
}
