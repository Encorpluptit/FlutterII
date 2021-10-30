import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/movies_list_bloc.dart';
import 'package:movieapp/src/models/list_item_model.dart';
import 'package:movieapp/src/ui/widgets/movie_list_item.dart';

class MovieListView extends StatefulWidget {
  final String type;
  final Function(int movieId) onItemInteraction;

  const MovieListView(
      {Key? key, required this.type, required this.onItemInteraction})
      : super(key: key);

  @override
  State createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    movieListBloc.fetchMovieList(widget.type);
    return StreamBuilder(
      stream: movieListBloc.movieList,
      builder: (context, AsyncSnapshot<ListItemModel> snapshot) {
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
      AsyncSnapshot<ListItemModel> snapshot, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 1.75,
      margin: const EdgeInsets.only(bottom: 10, top: 20),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data!.results.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                widget.onItemInteraction(snapshot.data!.results[index].id);
              },
              child:
                  MovieListItemViewState(movie: snapshot.data!.results[index])
              // child: _buildItem(
              //     snapshot.data!.results[index].posterPath,
              //     snapshot.data!.results[index].backdropPath,
              //     width / 4,
              //     index == 0),
              );
        },
      ),
    );
  }

  _buildItem(
      String imagePath, String backdropPath, double itemHeight, bool isFirst) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: EdgeInsets.only(left: isFirst ? 20 : 10, right: 10, bottom: 20),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500$imagePath',
        fit: BoxFit.cover,
        width: itemHeight * 4 / 3,
        height: itemHeight,
      ),
    );
  }
}
