import 'dart:async';
import 'dart:convert';

import 'network_provider.dart';

class GenreApiProvider extends NetworkProvider {
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Future<Object> fetchGenreList() async {
    var url = NewRequest("https://flutter-mymovie-api.herokuapp.com/genres");
    final response = await MakeGETRequest(url);
    if (GetStatusCode() == 200) {
      final results = json.decode(response);
      return (results["data"]);
    }
    return ({});
  }
}
