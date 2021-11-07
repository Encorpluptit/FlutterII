part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailsLoadEvent extends MovieDetailsEvent {}

class MovieDetailsRefreshEvent extends MovieDetailsEvent {}
