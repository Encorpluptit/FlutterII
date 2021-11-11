import 'package:flutter/material.dart';
import 'package:movieapp/src/models/movie.dart';

import '../movie_item.dart';

class GenreFilteredMovieListView extends StatefulWidget {
  final List<Movie> movies;
  final int filteredGenresLength;

  const GenreFilteredMovieListView(
      {Key? key, required this.movies, required this.filteredGenresLength})
      : super(key: key);

  @override
  State createState() => _GenreFilteredMovieListState();
}

class _GenreFilteredMovieListState extends State<GenreFilteredMovieListView> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.filteredGenresLength.toString());
    if (widget.movies.isEmpty && widget.filteredGenresLength > 0) {
      return (const Scaffold(
          body: Center(
        child: Text(
          "Nothing 😢",
          style: TextStyle(fontSize: 20),
        ),
      )));
    } else if (widget.movies.isEmpty && widget.filteredGenresLength == 0) {
      return (const Scaffold(
          body: Center(
        child: Text(
          "Select a filter.",
          style: TextStyle(fontSize: 20),
        ),
      )));
    }
    return Scaffold(
      body: GridView.count(
        cacheExtent: 999,
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
