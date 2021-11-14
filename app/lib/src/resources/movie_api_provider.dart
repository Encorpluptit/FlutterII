import 'dart:async';
import 'dart:convert';

import 'network_provider.dart';

class MovieApiProvider extends NetworkProvider {
  Future<Object> fetchMovieList(String type) async {
    var url = NewRequest("https://flutter-mymovie-api.herokuapp.com/movies");
    final response = await MakeGETRequest(url);
    if (GetStatusCode() == 200) {
      final results = json.decode(response);
      return (results["data"]);
    }
    return ({});
  }

  Future<Object> fetchMovieDetails(String id) async {
    var url =
        NewRequest("https://flutter-mymovie-api.herokuapp.com/movies/$id");
    final response = await MakeGETRequest(url);
    if (GetStatusCode() == 200) {
      final results = json.decode(response);
      return (results["data"]);
    }
    return ({});
  }

  Future<Object> fetchMovieBySearch(String content) async {
    var url =
        NewRequest("https://flutter-mymovie-api.herokuapp.com/movies/search");
    final response = await MakePOSTRequest(url, {"content": content});
    if (GetStatusCode() == 200) {
      final results = json.decode(response);
      return (results["data"]);
    }
    return ({});
  }

  Future<Object> fetchGenres(List<String> ids) async {
    var url = NewRequest("https://flutter-mymovie-api.herokuapp.com/genres/");
    final response = await MakeGETRequest(url);
    if (GetStatusCode() == 200) {
      final results = json.decode(response);
      return (results["data"]);
    }
    return ({});
  }
}
