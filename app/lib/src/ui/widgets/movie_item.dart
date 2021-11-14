import 'package:flutter/material.dart';
import 'package:movieapp/src/models/movie.dart';
import 'package:movieapp/src/ui/widgets/custom_image.dart';

typedef SearchFunction = void Function(String movie_id);

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movie,
    required this.onSearch,
  }) : super(key: key);

  final Movie movie;
  final SearchFunction onSearch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSearch(movie.id),
      child: GridTile(
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
        child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            clipBehavior: Clip.antiAlias,
            child: ImageWithLoading(imageUrl: movie.poster)),
      ),
    );
  }
}
