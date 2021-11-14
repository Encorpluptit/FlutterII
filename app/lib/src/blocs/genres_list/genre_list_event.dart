part of 'genre_list_bloc.dart';

@immutable
abstract class GenreListEvent {
  const GenreListEvent();
}

class GenreListLoadEvent extends GenreListEvent {}

class GenreListRefreshEvent extends GenreListEvent {}

class GenreListUpdateFilters extends GenreListEvent {
  final List<GenreFilter> genres;
  final List<GenreFilter> newGenres;

  const GenreListUpdateFilters(this.genres, this.newGenres);
}

class GenreListClickOnDetails extends GenreListEvent {
  final String id;

  const GenreListClickOnDetails(this.id);
}
