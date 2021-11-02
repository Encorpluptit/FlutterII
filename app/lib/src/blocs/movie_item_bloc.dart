import 'dart:async';

class MovieItem {
  final _favorite = false;

  // TODO DB connection to put in fav ?
  final _favoriteStreamController = StreamController<bool>();
  StreamSink<bool> get _infavorite => _favoriteStreamController.sink;
  Stream<bool> get favorite => _favoriteStreamController.stream;
}
