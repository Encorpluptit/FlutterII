import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp/src/models/item_model.dart';

class MovieListItemViewState extends StatelessWidget {
  final ItemModel movie;
  final Function(int movieId) navigateToItemDetail;

  MovieListItemViewState({
    required this.movie,
    required this.navigateToItemDetail,
  }) : super(key: ObjectKey(movie));

  void showImageDialog(
      {required BuildContext ctx, required String path}) async {
    showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: _ImageDialog(posterPath: path),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: ctx,
      pageBuilder: (context, animation1, animation2) {
        throw '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final String posterPath =
        'https://image.tmdb.org/t/p/w500${movie.posterPath}';
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // clipBehavior: Clip.hardEdge,
      elevation: 10.0,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      color: Colors.white24,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: InkWell(
              onTap: () {
                navigateToItemDetail(movie.id);
              },
              onLongPress: () async {
                showImageDialog(ctx: context, path: posterPath);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      posterPath,
                      fit: BoxFit.cover,
                      width: width / 3.5,
                      height: height / 5,
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: InkWell(
              onTap: () {
                navigateToItemDetail(movie.id);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    thickness: 2,
                  ),
                  Flexible(
                    child: Text(
                      movie.overview,
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          movie.releaseDate!.year.toString(),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
// =======
//       color: const Color.fromARGB(100, 120, 144, 156),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Flexible(
//               child: Image.network(
//                   'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//                   fit: BoxFit.cover)),
//           Flexible(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Flexible(
//                   child: Text(
//                     movie.title,
//                     softWrap: true,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const Divider(
//                   color: Colors.black,
//                   thickness: 2,
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Flexible(
//                       child: Text(
//                         movie.overview,
//                         softWrap: true,
//                         maxLines: 20,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     )),
//               ],
// >>>>>>> 8b0f7c7 (Add a better design for movie list item)
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageDialog extends StatelessWidget {
  final String posterPath;

  _ImageDialog({
    required this.posterPath,
  }) : super(key: ObjectKey(posterPath));

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Dialog(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        // width: 200,
        // height: 200,
        width: width * 0.8,
        height: height * 0.6,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(posterPath),
            fit: BoxFit.contain,
          ),
          // shape: BoxShape.circle
        ),
      ),
    );
  }
}
