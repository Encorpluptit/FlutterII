part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

class MovieDetailsLoadEvent extends MovieDetailsEvent {}

class MovieDetailsRefreshEvent extends MovieDetailsEvent {}
