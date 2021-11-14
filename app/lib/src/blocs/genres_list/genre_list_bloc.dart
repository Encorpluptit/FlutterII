import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
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
  }

  Future<GenreListState> _genreListLoad() async {
    try {
      final genres = await repository.fetchGenreList() as dynamic;
      List<GenreFilter> _genres = [];
      for (int i = 0; i < genres.length; i++) {
        _genres.add(GenreFilter.fromJSON(genres[i]));
      }
      debugPrint(_genres.map((v) => '${v.id} -> ${v.name}').toString());
      return GenreListLoadedSuccess(_genres);
    } on Exception catch (error) {
      return GenreListLoadedFailure(error.toString());
    }
  }

  Future<GenreListState> _genreListUpdateFilters(
      GenreListUpdateFilters event) async {
    debugPrint('Updating Genres Event');
    try {
      final newFilters = event.newGenres;
      for (int i = 0; i < newFilters.length; i++) {
        var elem = event.genres
            .firstWhere((element) => element.id == newFilters[i].id);
        elem.active = newFilters[i].active;
      }
      return GenreListUpdatedSuccess(newFilters);
    } on Exception catch (error) {
      return GenreListLoadedFailure(error.toString());
    }
  }
}
