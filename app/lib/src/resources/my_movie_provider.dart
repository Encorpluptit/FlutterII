import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/src/models/movie_detail_model.dart';

class MyMovieProvider {
  http.Client client = http.Client();

  Future<MovieDetailModel> fetchMovieDetails(String id) async {
    var url = Uri.parse("http://10.0.2.2:8080/movies/$id");
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return MovieDetailModel(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
