part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListEvent {
  const MovieListEvent();

  @override
  List<Object> get props => [];
}

class MovieListLoadEvent extends MovieListEvent {}

class MovieListRefreshEvent extends MovieListEvent {}
