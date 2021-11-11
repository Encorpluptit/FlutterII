part of 'genre_list_bloc.dart';

abstract class GenreListState {
  const GenreListState();
}

class GenreListLoading extends GenreListState {
  GenreListLoading();
}

class GenreListLoadedSuccess extends GenreListState {
  final List<Genre> genres;
  final List<Genre> filteredGenres;
  final List<Movie> movies;

  const GenreListLoadedSuccess([
    this.genres = const [],
    this.filteredGenres = const [],
    this.movies = const [],
  ]);
}

class GenreListLoadedFailure extends GenreListState {
  String cause = "";

  GenreListLoadedFailure(this.cause);
}

class GenreListClickAddToFilterSuccess extends GenreListState {
  final Genre genre;

  const GenreListClickAddToFilterSuccess(this.genre);
}

class GenreListClickRemoveFromFilterSuccess extends GenreListState {
  final Genre genre;

  const GenreListClickRemoveFromFilterSuccess(this.genre);
}