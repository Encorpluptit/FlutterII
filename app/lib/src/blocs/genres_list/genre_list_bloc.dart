import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/models/genre.dart';
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
    if (event is GenreListClickAddToFilter) {
      setState(await _genreListAddToFilter(event));
    }
    if (event is GenreListClickRemoveFromFilter) {
      setState(await _genreListRemoveFromFilter(event));
    }
  }

  Future<GenreListState> _genreListLoad() async {
    try {
      final genres = await repository.fetchGenreList() as dynamic;
      List<Genre> _genres = [];
      for (int i = 0; i < genres.length; i++) {
        _genres.add(Genre(genres[i]));
      }
      debugPrint(_genres.map((v) => '${v.id} -> ${v.name}').toString());
      return GenreListLoadedSuccess(_genres);
    } on Exception catch (error) {
      return GenreListLoadedFailure(error.toString());
    }
  }

  Future<GenreListState> _genreListAddToFilter(
      GenreListClickAddToFilter event) async {
    return (GenreListClickAddToFilterSuccess(event.genre));
  }

  Future<GenreListState> _genreListRemoveFromFilter(
      GenreListClickRemoveFromFilter event) async {
    return (GenreListClickRemoveFromFilterSuccess(event.genre));
  }
}
