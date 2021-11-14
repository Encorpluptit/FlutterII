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
  // GenreListLoadedSuccess([
  //   this.genres = const [],
  //   this.filteredGenres = const [],
  //   this.movies = const [],
  // ]);
}

class GenreListLoadedFailure extends GenreListState {
  String cause = "";

  GenreListLoadedFailure(this.cause);
}

class GenreListClickAddToFilterSuccess extends GenreListLoadedSuccess {
  final Genre genre;

  GenreListClickAddToFilterSuccess(this.genre) {
    for (int i = 0; i < filteredGenres.length; i++) {
      if (filteredGenres[i].id == genre.id) {
        filteredGenres[i].active = true;
        debugPrint(
            'GenreListClickAddToFilterSuccess: Activating ${genre.name}');
        return;
      }
    }
  }
}

class GenreListClickRemoveFromFilterSuccess extends GenreListState {
  final Genre genre;

  const GenreListClickRemoveFromFilterSuccess(this.genre);
}
