import 'dart:async';
import 'dart:convert';

import 'network_provider.dart';

class MovieApiProvider extends NetworkProvider {
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Future<Object> fetchMovieList(String type) async {
    var url = NewRequest("https://flutter-mymovie-api.herokuapp.com/movies");
    final response = await MakeRequest(url);
    if (GetStatusCode() == 200) {
      final results = json.decode(response);
      return (results["data"]);
    }
    return ({});
  }

  Future<Object> fetchMovieDetails(String id) async {
    return ("null");
  }
}
