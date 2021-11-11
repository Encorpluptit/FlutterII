part of 'genre_list_bloc.dart';

@immutable
abstract class GenreListEvent {
  const GenreListEvent();
}

class GenreListLoadEvent extends GenreListEvent {}

class GenreListRefreshEvent extends GenreListEvent {}

class GenreListClickAddToFilter extends GenreListEvent {
  final Genre genre;

  const GenreListClickAddToFilter(this.genre);
}

class GenreListClickRemoveFromFilter extends GenreListEvent {
  final Genre genre;

  const GenreListClickRemoveFromFilter(this.genre);
}
