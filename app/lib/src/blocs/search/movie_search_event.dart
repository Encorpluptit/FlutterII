part of 'movie_search_bloc.dart';

@immutable
abstract class MovieSearchEvent {
  const MovieSearchEvent();
}

class MovieSearchWaitEvent extends MovieSearchEvent {}

class MovieSearchLoadEvent extends MovieSearchEvent {}

class MovieSearchRefreshEvent extends MovieSearchEvent {}

class MovieSearchFetchEvent extends MovieSearchEvent {
  final String search;

  const MovieSearchFetchEvent(this.search);
}

class MovieSearchClickOnDetails extends MovieSearchEvent {
  final String id;

  const MovieSearchClickOnDetails(this.id);
}
