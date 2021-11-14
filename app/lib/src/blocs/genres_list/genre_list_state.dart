part of 'genre_list_bloc.dart';

abstract class GenreListState {
  const GenreListState();
}

class GenreListLoading extends GenreListState {
  GenreListLoading();
}

class GenreListLoadedSuccess extends GenreListState {
  List<GenreFilter> filteredGenres = [];
  List<Movie> movies = [];

  GenreListLoadedSuccess([this.filteredGenres = const []]);
}

class GenreListLoadedFailure extends GenreListState {
  String cause = "";

  GenreListLoadedFailure(this.cause);
}

class GenreListUpdatedSuccess extends GenreListState {
  List<GenreFilter> filteredGenres = [];
  List<Movie> movies = [];

  GenreListUpdatedSuccess(
      [this.filteredGenres = const [], this.movies = const []]);
}

class GenreListClickOnDetailsSuccess extends GenreListState {
  final String id;

  const GenreListClickOnDetailsSuccess(this.id);
}
