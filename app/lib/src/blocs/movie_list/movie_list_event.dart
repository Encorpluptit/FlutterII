part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListEvent {
  const MovieListEvent();

  @override
  List<Object> get props => [];
}

class MovieListLoaded extends MovieListEvent {}
