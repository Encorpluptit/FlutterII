import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/constants/global.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchState, MovieSearchEvent> {
  final Repository repository = Repository();

  MovieSearchBloc() : super(MovieSearchWaiting());

  @override
  Future<void> mapEventToState(Object event) async {
    if (event is MovieSearchFetchEvent) {
      setState(await _MovieSearchLoad(event));
    }
    if (event is MovieSearchClickOnDetails) {
      setState(await _MovieSearchClickOnDetails(event));
    }
  }

  Future<MovieSearchState> _MovieSearchLoad(MovieSearchFetchEvent event) async {
    try {
      final movies =
          await repository.fetchMovieList(MovieListType.topRated) as dynamic;
      List<Movie> _movies = [];
      for (int i = 0; i < movies.length; i++) {
        _movies.add(Movie(movies[i]));
      }
      return MovieSearchLoadedSuccess(_movies);
    } on Exception catch (error) {
      return MovieSearchLoadedFailure(error.toString());
    }
  }

  Future<MovieSearchState> _MovieSearchClickOnDetails(
      MovieSearchClickOnDetails event) async {
    return (MovieSearchClickOnDetailsSuccess(event.id));
  }
}
