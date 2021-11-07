import 'package:flutter/material.dart';
import 'package:movieapp/src/models/movie.dart';

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
          return _GridDemoPhotoItem(
            movie: movie,
          );
        }).toList(),
      ),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  const _GridDemoPhotoItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${movie.posterPath.toString()}',
        fit: BoxFit.cover,
      ),
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(movie.title),
          ),
        ),
      ),
      child: image,
    );
  }
}
