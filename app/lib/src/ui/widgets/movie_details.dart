// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/src/blocs/movie_detail_bloc.dart';
import 'package:movieapp/src/models/movie_detail_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    movieDetailBloc.fetchMovieDetails("6186edc4fa0bfbcc3466ae29");
    return StreamBuilder(
      stream: movieDetailBloc.details,
      builder: (context, AsyncSnapshot<MovieDetailModel> snapshot) {
        if (snapshot.hasData) {
          return buildContent(snapshot, context);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Container(
            padding: const EdgeInsets.all(20.0),
            child: const Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget buildContent(
      AsyncSnapshot<MovieDetailModel> snapshot, BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.network(
                          'https://image.tmdb.org/t/p/w500${snapshot.data!.poster}')),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        snapshot.data!.title,
                        style: GoogleFonts.redHatDisplay(
                          textStyle: const TextStyle(
                              fontSize: 25.0, letterSpacing: .5),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      snapshot.data!.synopsis,
                      style: GoogleFonts.redHatDisplay(
                        textStyle:
                            const TextStyle(fontSize: 14.0, letterSpacing: .5),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 225,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.images.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                                'https://image.tmdb.org/t/p/w500${snapshot.data!.images[index]}');
                          }))
                ],
                // SizedBox(
                //     height: 300,
                //     child: ListView(
                //       scrollDirection: Axis.horizontal,
                //       children: [
                //         Image.network(
                //             'https://image.tmdb.org/t/p/w500${snapshot.data!.images[1]}'),
                //         Container(
                //           width: 175.0,
                //           color: Colors.blue,
                //         ),
                //         Container(
                //           width: 175.0,
                //           color: Colors.green,
                //         ),
                //         Container(
                //           width: 175.0,
                //           color: Colors.yellow,
                //         ),
                //         Container(
                //           width: 175,
                //           color: Colors.orange,
                //         ),
                //       ],
                //     ))
              ))),
    );
  }
}
