import 'package:movieapp/src/blocs/base.dart';
import 'package:movieapp/src/models/list_item_model.dart';

class MovieListBloc extends BaseBloc<ListItemModel> {
  Stream<ListItemModel> get movieList => fetcher.stream;

  fetchMovieList(String type) async {
    ListItemModel itemModel = await repository.fetchMovieList(type);
    fetcher.sink.add(itemModel);
  }
}

final movieListBloc = MovieListBloc();
