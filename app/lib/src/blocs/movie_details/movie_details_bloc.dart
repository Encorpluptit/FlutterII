import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final Repository repository = Repository();
  MovieDetailsBloc() : super(MovieDetailsLoading());

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event) async* {
    if (event is MovieDetailsLoadEvent || event is MovieDetailsRefreshEvent) {
      yield* _MovieDetailsLoad();
    }
  }

  Stream<MovieDetailsState> _MovieDetailsLoad() async* {
    try {
      //TODO
      final movies = await repository.fetchMovieDetails("state") as dynamic;
      //TODO
      yield MovieDetailsLoadedSuccess(movies);
    } catch (_) {
      yield MovieDetailsLoadedFailure();
    }
  }
}
