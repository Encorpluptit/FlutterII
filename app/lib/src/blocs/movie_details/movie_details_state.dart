part of 'movie_details_bloc.dart';

abstract class MovieDetailsState {
  const MovieDetailsState();

  List<Object> get props => [];
}

class MovieDetailsLoading extends MovieDetailsState {
  MovieDetailsLoading();
}

class MovieDetailsLoadedSuccess extends MovieDetailsState {
  final List<Movie> movies;

  const MovieDetailsLoadedSuccess([this.movies = const []]);
}

class MovieDetailsLoadedFailure extends MovieDetailsState {}
