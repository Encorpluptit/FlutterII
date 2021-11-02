// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/src/models/item_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  final ItemModel movie;
  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                          'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}')),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.movie.title,
                        style:
                            const TextStyle(fontFamily: 'Aleo', fontSize: 25.0),
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Zeebi',
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                  SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 175.0,
                            color: Colors.red,
                          ),
                          Container(
                            width: 175.0,
                            color: Colors.blue,
                          ),
                          Container(
                            width: 175.0,
                            color: Colors.green,
                          ),
                          Container(
                            width: 175.0,
                            color: Colors.yellow,
                          ),
                          Container(
                            width: 175,
                            color: Colors.orange,
                          ),
                        ],
                      ))
                ],
              ))),
    );
  }
}
