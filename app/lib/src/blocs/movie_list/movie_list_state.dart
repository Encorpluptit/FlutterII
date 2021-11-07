part of 'movie_list_bloc.dart';

abstract class MovieListState {
  const MovieListState();

  List<Object> get props => [];
}

class MovieListLoading extends MovieListState {
  MovieListLoading();

  @override
  List<Object> get props => [];
}

class MovieListSuccess extends MovieListState {
  final List<Movie> movies;

  const MovieListSuccess([this.movies = const []]);

  @override
  List<Object> get props => [movies];

  @override
  String toString() => 'MovieListSuccess { todos: $movies }';
}

class MovieListFailure extends MovieListState {}
