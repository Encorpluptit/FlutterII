import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/movie_list/movie_list_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/screens/movie_details_screen.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';
import 'package:movieapp/src/ui/widgets/movie_list.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  _MovieListScreen createState() => _MovieListScreen();
}

class _MovieListScreen extends State<MovieListScreen> {
  MovieListBloc bloc = Provider.getBloc<MovieListBloc>() as MovieListBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocListener<MovieListBloc, MovieListState>(
        bloc: bloc,
        listener: (BuildContext context, MovieListState state) {
          if (state is MovieListLoadedFailure) {
            var snackBar = SnackBar(
              duration: const Duration(minutes: 5),
              content: Text(state.cause),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'Retry',
                onPressed: () {
                  bloc.dispatch(MovieListLoadEvent());
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
            bloc: bloc,
            shouldBuild: (MovieListState current) {
              if (current is MovieListClickOnDetailsSuccess) {
                return (false);
              }
              return (true);
            },
            builder: (context, state) {
              if (state is MovieListLoading) {
                return (const Center(
                  child: CircularProgressIndicator(),
                ));
              } else if (state is MovieListLoadedSuccess) {
                return (RefreshIndicator(
                    onRefresh: () async {
                      bloc.dispatch(MovieListLoadEvent());
                    },
                    child: MovieListView(
                      movies: state.movies,
                      onSearch: (String movie_id) =>
                          Provider.getBloc<MovieListBloc>()
                              .dispatch(MovieListClickOnDetails(movie_id)),
                    )));
              } else if (state is MovieListLoadedFailure) {
                return (Container());
              } else {
                return (Container());
              }
            }),
      ),
    );
  }
}
