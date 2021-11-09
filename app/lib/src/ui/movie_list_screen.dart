import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/blocs/movie_list/movie_list_bloc.dart';
import 'package:movieapp/src/ui/movie_details_screen.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';
import 'package:movieapp/src/ui/widgets/movie_list.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocListener<MovieListBloc, MovieListState>(
        listener: (context, state) {
          if (state is MovieListLoadedFailure) {
            var snackBar = SnackBar(
              duration: Duration(minutes: 5),
              content: Text(state.cause),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'Retry',
                onPressed: () {
                  BlocProvider.of<MovieListBloc>(context)
                      .add(MovieListLoadEvent());
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is MovieListClickOnDetailsSuccess) {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => MovieDetailsScreen(id: state.id)));
          }
        },
        child: BlocBuilder<MovieListBloc, MovieListState>(
            buildWhen: (MovieListState previous, MovieListState current) {
          if (current is MovieListClickOnDetailsSuccess) {
            return (false);
          }
          return (true);
        }, builder: (context, state) {
          if (state is MovieListLoading) {
            return (const Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is MovieListLoadedSuccess) {
            return (RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<MovieListBloc>(context)
                      .add(MovieListLoadEvent());
                },
                child: MovieListView(movies: state.movies)));
          } else if (state is MovieListLoadedFailure) {
            return (const MovieListView(movies: []));
          } else {
            return (Container());
          }
        }),
      ),
    );
  }
}
