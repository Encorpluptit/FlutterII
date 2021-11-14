import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/genres_list/genre_list_bloc.dart';
import 'package:movieapp/src/models/genre_filter.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/ui/widgets//movie_item.dart';
import 'package:movieapp/src/ui/widgets/genres/filter_list.dart';

class GenreFilteredMovieListView extends StatefulWidget {
  final GenreListBloc bloc;
  final List<Movie> movies;
  final List<GenreFilter> filteredGenres;

  const GenreFilteredMovieListView(
      {Key? key,
      required this.bloc,
      required this.movies,
      required this.filteredGenres})
      : super(key: key);

  @override
  State createState() => _GenreFilteredMovieListState();
}

class _GenreFilteredMovieListState extends State<GenreFilteredMovieListView> {
  bool debug = false;

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.filteredGenres.length.toString());
    bool filterActive =
        widget.filteredGenres.indexWhere((element) => element.active == true) >=
            0;
    if (widget.movies.isEmpty && filterActive) {
      return (Scaffold(
        body: const Center(
          child: Text(
            "Nothing 😢",
            style: TextStyle(fontSize: 20),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('ok'),
          tooltip: 'Filters',
          child: const Icon(Icons.filter),
        ),
      ));
    }
    if (widget.movies.isEmpty && !filterActive) {
      return (Scaffold(
        body: const Center(
          child: Text(
            "Select a filter.",
            style: TextStyle(fontSize: 20),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return MyFilterListView(filteredGenres: widget.filteredGenres);
              }),
          tooltip: 'Filters',
          child: const Icon(Icons.filter),
        ),
      ));
    }
    return Scaffold(
      body: GridView.count(
        cacheExtent: 999,
        crossAxisCount: 1,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: (0.60),
        children: widget.movies.map<Widget>((movie) {
          return MovieItem(
            movie: movie,
            onSearch: (String movie_id) {},
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('ok'),
        tooltip: 'Filters',
        child: const Icon(Icons.filter),
      ),
    );
  }
}
