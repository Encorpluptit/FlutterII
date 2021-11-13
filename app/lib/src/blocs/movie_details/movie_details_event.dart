part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

class MovieDetailsLoadEvent extends MovieDetailsEvent {
  final String id;
  const MovieDetailsLoadEvent(this.id);
}

class MovieDetailsRefreshEvent extends MovieDetailsEvent {
  final String id;
  const MovieDetailsRefreshEvent(this.id);
}
