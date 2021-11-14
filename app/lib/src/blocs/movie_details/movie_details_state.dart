part of 'movie_details_bloc.dart';

abstract class MovieDetailsState {
  const MovieDetailsState();
}

class MovieDetailsLoading extends MovieDetailsState {
  MovieDetailsLoading();
}

class MovieDetailsLoadedSuccess extends MovieDetailsState {
  final Movie movie;

  const MovieDetailsLoadedSuccess(this.movie);
}

class MovieDetailsLoadedFailure extends MovieDetailsState {
  String cause = "";

  MovieDetailsLoadedFailure(this.cause);
}
