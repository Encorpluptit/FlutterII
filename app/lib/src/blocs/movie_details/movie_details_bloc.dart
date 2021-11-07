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
      final movies = await repository.fetchMovieDetails("state") as dynamic;
      List<Movie> _movies = [];
      for (int i = 0; i < movies.length; i++) {
        _movies.add(Movie(movies[i]));
      }
      yield MovieDetailsLoadedSuccess(_movies);
    } catch (_) {
      yield MovieDetailsLoadedFailure();
    }
  }
}
