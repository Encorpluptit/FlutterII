part of 'genre_list_bloc.dart';

@immutable
abstract class GenreListEvent {
  const GenreListEvent();
}

class GenreListLoadEvent extends GenreListEvent {}

class GenreListRefreshEvent extends GenreListEvent {}

class GenreListAddFilters extends GenreListEvent {
  final List<GenreFilter> genres;

  const GenreListAddFilters(this.genres);
}

class GenreListUpdateFilters extends GenreListEvent {
  final List<GenreFilter> genres;
  final List<GenreFilter> newGenres;

  const GenreListUpdateFilters(this.genres, this.newGenres);
}

// class GenreListClickAddToFilter extends GenreListEvent {
//   final Genre genre;
//
//   const GenreListClickAddToFilter(this.genre);
// }
//
// class GenreListClickRemoveFromFilter extends GenreListEvent {
//   final Genre genre;
//
//   const GenreListClickRemoveFromFilter(this.genre);
// }
