import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsState, MovieDetailsEvent> {
  final Repository repository = Repository();
  MovieDetailsBloc() : super(MovieDetailsLoading());

  @override
  Future<void> mapEventToState(Object event) async {
    if (event is MovieDetailsLoadEvent) {
      setState(await _MovieDetailsLoad(event));
    }
  }

  Future<MovieDetailsState> _MovieDetailsLoad(
      MovieDetailsLoadEvent event) async {
    try {
      final movie = await repository.fetchMovieDetails(event.id) as dynamic;
      final _movie = Movie(movie);
      return MovieDetailsLoadedSuccess(_movie);
    } on Exception catch (error) {
      return MovieDetailsLoadedFailure(error.toString());
    }
  }
}
