import 'package:movieapp/src/blocs/base.dart';
import 'package:movieapp/src/models/movie_detail_model.dart';

class MovieDetailBloc extends BaseBloc<MovieDetailModel> {
  Stream<MovieDetailModel> get details => fetcher.stream;

  fetchMovieDetails(String id) async {
    MovieDetailModel itemModel = await repository.fetchMovieDetails(id);
    fetcher.sink.add(itemModel);
  }
}

final movieDetailBloc = MovieDetailBloc();
