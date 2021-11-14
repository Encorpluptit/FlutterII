import 'dart:async';

import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/constants/global.dart';
import 'package:movieapp/src/models/genre_filter.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'genre_list_event.dart';
part 'genre_list_state.dart';

class GenreListBloc extends Bloc<GenreListState, GenreListEvent> {
  final Repository repository = Repository();

  GenreListBloc() : super(GenreListLoading());

  @override
  Future<void> mapEventToState(Object event) async {
    if (event is GenreListLoadEvent || event is GenreListRefreshEvent) {
      setState(await _genreListLoad());
    }
    if (event is GenreListUpdateFilters) {
      setState(await _genreListUpdateFilters(event));
    }
    if (event is GenreListClickOnDetails) {
      setState(await _clickOnDetails(event));
    }
  }

  Future<GenreListState> _genreListLoad() async {
    try {
      final genres = await repository.fetchGenreList() as dynamic;
      List<GenreFilter> _genres = [];
      for (int i = 0; i < genres.length; i++) {
        _genres.add(GenreFilter.fromJSON(genres[i]));
      }
      return GenreListLoadedSuccess(_genres);
    } on Exception catch (error) {
      return GenreListLoadedFailure(error.toString());
    }
  }

  Future<GenreListState> _genreListUpdateFilters(
      GenreListUpdateFilters event) async {
    try {
      final filters = event.newGenres.where((e) => e.active == true);
      final movies =
          await repository.fetchMovieList(MovieListType.topRated) as dynamic;
      List<Movie> _movies = [];

      for (int i = 0; i < movies.length; i++) {
        var movie = Movie(movies[i]);
        for (int j = 0; j < movie.genres.length; j++) {
          GenreFilter? f =
              filters.firstWhereOrNull((e) => e.name == movie.genres[j]);
          if (f != null) {
            _movies.add(movie);
          }
        }
      }
      return GenreListUpdatedSuccess(event.newGenres, _movies);
    } on Exception catch (error) {
      return GenreListLoadedFailure(error.toString());
    }
  }

  Future<GenreListState> _clickOnDetails(GenreListClickOnDetails event) async {
    return GenreListClickOnDetailsSuccess(event.id);
  }
}
