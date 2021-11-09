import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/constants/global.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListState, MovieListEvent> {
  final Repository repository = Repository();

  MovieListBloc() : super(MovieListLoading());

  @override
  Future<void> mapEventToState(Object event) async {
    if (event is MovieListLoadEvent || event is MovieListRefreshEvent) {
      setState(await _MovieListLoad());
    }
    if (event is MovieListClickOnDetails) {
      setState(await _MovieListClickOnDetails(event));
    }
  }

  Future<MovieListState> _MovieListLoad() async {
    try {
      final movies =
          await repository.fetchMovieList(MovieListType.topRated) as dynamic;
      List<Movie> _movies = [];
      for (int i = 0; i < movies.length; i++) {
        _movies.add(Movie(movies[i]));
      }
      return MovieListLoadedSuccess(_movies);
    } on Exception catch (error) {
      return MovieListLoadedFailure(error.toString());
    }
  }

  Future<MovieListState> _MovieListClickOnDetails(
      MovieListClickOnDetails event) async {
    return (MovieListClickOnDetailsSuccess(event.id));
  }
}
