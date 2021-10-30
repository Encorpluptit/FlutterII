import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/src/models/list_item_model.dart';

class MovieApiProvider {
  http.Client client = http.Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Future<ListItemModel> fetchMovieList(String type) async {
    var url =
        Uri.parse("http://api.themoviedb.org/3/movie/$type?api_key=$_apiKey");
    final response = await client.get(url);
    print(response.request!.url);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ListItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  // Future<MovieDetailModel> fetchMovieDetail(int movieId) async {
  //   final response = await client
  //       .get("http://api.themoviedb.org/3/movie/$movieId?api_key=$_apiKey");
  //   print(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return MovieDetailModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }
  //
  //
  // Future<MovieImageModel> fetchMovieImages(int movieId) async {
  //   final response = await client
  //       .get("http://api.themoviedb.org/3/movie/$movieId/images?api_key=$_apiKey");
  //   print(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return MovieImageModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }

}
