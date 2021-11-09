import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkProvider {
  final http.Client client = http.Client();
  String error = "";
  int statusCode = 0;

  NetworkProvider();

  Uri NewRequest(String url) {
    try {
      var uri = Uri.parse(url);

      return (uri);
    } on FormatException catch (err) {
      debugPrint(err.toString());
      throw Exception("[Error] Wrong URL provided.");
    }
  }

  Future<String> MakeRequest(Uri url) async {
    try {
      final response = await client.get(url);

      statusCode = response.statusCode;

      return (response.body);
    } on SocketException {
      error = '[Error] No Internet connection';
    } on HttpException {
      error = "[Error] Couldn't find the resource";
    } on FormatException {
      error = "[Error] Bad response format";
    }
    debugPrint(error);
    throw Exception(error);
  }

  String GetError() {
    return (error);
  }

  int GetStatusCode() {
    return (statusCode);
  }
}
