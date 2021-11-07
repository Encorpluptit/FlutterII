import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/constants/global.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final Repository repository = Repository();
  MovieListBloc() : super(MovieListLoading());

  @override
  Stream<MovieListState> mapEventToState(MovieListEvent event) async* {
    if (event is MovieListLoadEvent || event is MovieListRefreshEvent) {
      yield* _MovieListLoad();
    }
    if (event is MovieListClickOnDetails) {
      yield* _MovieListClickOnDetails(event);
    }
  }

  Stream<MovieListState> _MovieListLoad() async* {
    try {
      yield MovieListLoading();
      final movies =
          await repository.fetchMovieList(MovieListType.topRated) as dynamic;
      List<Movie> _movies = [];
      for (int i = 0; i < movies.length; i++) {
        _movies.add(Movie(movies[i]));
      }
      yield MovieListLoadedSuccess(_movies);
    } catch (_) {
      yield MovieListLoadedFailure();
    }
  }

  Stream<MovieListState> _MovieListClickOnDetails(
      MovieListClickOnDetails event) async* {
    yield MovieListClickOnDetailsSuccess(event.id);
  }
}
