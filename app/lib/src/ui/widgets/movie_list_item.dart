import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/src/models/item_model.dart';

// class MovieListItem extends StatefulWidget {
//   // final String type;
//   // final Function(int movieId) onItemInteraction;
//
//   const MovieListItem(
//       {Key? key})
//       : super(key: key);
//
//   @override
//   State createState() => _MovieListViewState();
// }

// class _MovieListItemViewState extends State<MovieListView> {
class MovieListItemViewState extends StatelessWidget {
  final ItemModel movie;

  MovieListItemViewState({
    required this.movie,
  }) : super(key: ObjectKey(movie));

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      color: Colors.white38,
      child: SizedBox(
        width: width / 5,
        // height: height / 5,
        height: height / 6,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                  width: width / 4,
                  height: height / 6,
                )
              ],
            ),
            // Flexible(
            //   child: Card(
            //     // clipBehavior: ,
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: <Widget>[
            //         ListTile(
            //           title: Text(movie.title),
            //           subtitle: Text(
            //             movie.overview,
            //             maxLines: 4,
            //             overflow: TextOverflow.fade,
            //           ),
            //         ),
            //         // Row(
            //         //   mainAxisAlignment: MainAxisAlignment.end,
            //         //   children: <Widget>[
            //         //     TextButton(
            //         //       child: const Text('BUY TICKETS'),
            //         //       onPressed: () {/* ... */},
            //         //     ),
            //         //     const SizedBox(width: 8),
            //         //     TextButton(
            //         //       child: const Text('LISTEN'),
            //         //       onPressed: () {/* ... */},
            //         //     ),
            //         //     const SizedBox(width: 8),
            //         //   ],
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Flexible(
                //       // fit: FlexFit.tight,
                //       child: Text(
                //         movie.title,
                //         style: TextStyle(),
                //         softWrap: true,
                //         maxLines: 1,
                //         overflow: TextOverflow.ellipsis,
                //       ),
                //     )
                //   ],
                // ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Text(
                        movie.overview,
                        // style: TextStyle(),
                        softWrap: true,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// // class _MovieListItemViewState extends State<MovieListView> {
// class MovieListItemViewState extends StatelessWidget {
//   final ItemModel movie;
//
//   MovieListItemViewState({
//     required this.movie,
//   }) : super(key: ObjectKey(movie));
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Center(
//       child: Card(
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         elevation: 10.0,
//         margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         ),
//         color: Colors.white38,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ListTile(
//               title: Text(movie.title),
//               leading: Image.network(
//                 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//                 fit: BoxFit.cover,
//                 width: width / 6,
//                 height: height,
//               ),
//               subtitle: Text(
//                 movie.overview,
//                 maxLines: 4,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 TextButton(
//                   child: const Text('BUY TICKETS'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//                 TextButton(
//                   child: const Text('LISTEN'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//     return Card(
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       elevation: 10.0,
//       margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//       ),
//       color: Colors.white54,
//       child: ListTile(
//         title: Text(movie.title),
//         leading: Text(''),
//         subtitle: Text(movie.overview),
//       ),
//
//       // child: Row(
//       //   children: <Widget>[
//       //     Column(
//       //       children: [
//       //         Image.network(
//       //           'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//       //           fit: BoxFit.cover,
//       //           width: width / 4,
//       //           // height: ,
//       //         ),
//       //       ],
//       //     ),
//       //     Column(
//       //       children: <Widget>[
//       //         // const ListTile(
//       //         //   leading: Text(''),
//       //         //   title: Text(''),
//       //         //   subtitle: Text(''),
//       //         // ),
//       //         // ListTile(
//       //         //   leading: Icon(Icons.album),
//       //         //   title: Text('The Enchanted Nightingale'),
//       //         //   subtitle:
//       //         //       Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//       //         // ),
//       //         Text(
//       //           movie.title,
//       //           style: const TextStyle(
//       //             fontWeight: FontWeight.w700,
//       //           ),
//       //           textAlign: TextAlign.left,
//       //           softWrap: true,
//       //         ),
//       //         // Text(
//       //         //   movie.overview,
//       //         //   style: const TextStyle(
//       //         //     fontWeight: FontWeight.w700,
//       //         //   ),
//       //         //   textAlign: TextAlign.left,
//       //         //   overflow: TextOverflow.fade,
//       //         //   softWrap: false,
//       //         // )
//       //       ],
//       //     ),
//       //     Column(),
//       //   ],
//       // )
//       // child: Image.network(
//       //   'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//       //   fit: BoxFit.cover,
//       //   // width: width * 4 / 3,
//       //   // height: ,
//       // ),
//     );
//     // return Card(
//     //   clipBehavior: Clip.antiAliasWithSaveLayer,
//     //   elevation: 10.0,
//     //   margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
//     //   shape: const RoundedRectangleBorder(
//     //       borderRadius: BorderRadius.all(Radius.circular(10.0))),
//     //   child: Image.network(
//     //     'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//     //     fit: BoxFit.cover,
//     //     // width: width * 4 / 3,
//     //     // height: ,
//     //   ),
//     // );
//   }
// }

/// This is the stateless widget that the main application instantiates.
// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const ListTile(
//               leading: Icon(Icons.album),
//               title: Text('The Enchanted Nightingale'),
//               subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 TextButton(
//                   child: const Text('BUY TICKETS'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//                 TextButton(
//                   child: const Text('LISTEN'),
//                   onPressed: () {/* ... */},
//                 ),
//                 const SizedBox(width: 8),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// final
