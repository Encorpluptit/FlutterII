import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieApiProvider {
  http.Client client = http.Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Future<Object> fetchMovieList(String type) async {
    var url =
        Uri.parse("http://api.themoviedb.org/3/movie/$type?api_key=$_apiKey");
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final results = json.decode(response.body);
      return (results["results"]);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
