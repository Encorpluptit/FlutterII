import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsState, MovieDetailsEvent> {
  final Repository repository = Repository();
  MovieDetailsBloc();

  @override
  Future<void> mapEventToState(MovieDetailsEvent event) async {
    if (event is MovieDetailsLoadEvent || event is MovieDetailsRefreshEvent) {
      setState(await _MovieDetailsLoad());
    }
  }

  Future<MovieDetailsState> _MovieDetailsLoad() async {
    try {
      //TODO
      final movies = await repository.fetchMovieDetails("state") as dynamic;
      //TODO
      return MovieDetailsLoadedSuccess(movies);
    } catch (_) {
      return MovieDetailsLoadedFailure();
    }
  }
}
