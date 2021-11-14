import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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

  Future<String> MakePOSTRequest(Uri url, Object content) async {
    try {
      final response = await client.post(url,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: content,
          encoding: Encoding.getByName("utf-8"));

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

  Future<String> MakeGETRequest(Uri url) async {
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
