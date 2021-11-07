import 'package:flutter/material.dart';
import 'package:movieapp/src/models/movie.dart';

import 'movie_item.dart';

class MovieListView extends StatefulWidget {
  final List<Movie> movies;

  const MovieListView({Key? key, required this.movies}) : super(key: key);

  @override
  State createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: (0.60),
        children: widget.movies.map<Widget>((movie) {
          return MovieItem(
            movie: movie,
          );
        }).toList(),
      ),
    );
  }
}
