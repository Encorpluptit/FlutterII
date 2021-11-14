import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/genres_list/genre_list_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/ui/bloc_builder.dart';
import 'package:movieapp/src/ui/widgets/genres/filtered_movie_list.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';

class MovieGenreScreen extends StatefulWidget {
  const MovieGenreScreen({Key? key}) : super(key: key);

  @override
  _MovieGenreScreenState createState() => _MovieGenreScreenState();
}

class _MovieGenreScreenState extends State<MovieGenreScreen> {
  GenreListBloc bloc = Provider.getBloc<GenreListBloc>() as GenreListBloc;

  @override
  void initState() {
    bloc.dispatch(GenreListLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<GenreListBloc, GenreListState>(
        bloc: bloc,
        shouldBuild: (_) => true,
        listener: (BuildContext context, GenreListState state) {
          if (state is GenreListLoadedFailure) {
            var snackBar = SnackBar(
              duration: const Duration(minutes: 5),
              content: Text(state.cause),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'Retry',
                onPressed: () {
                  bloc.dispatch(GenreListLoadEvent());
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          // if (state is GenreListClickOnDetailsSuccess) {
          //   Navigator.push(
          //       context,
          //       CupertinoPageRoute(
          //           builder: (context) => MovieDetailsScreen(id: state.id)));
          // }
        },
        child: BlocStream<GenreListBloc, GenreListState>(
            bloc: bloc,
            shouldBuild: (GenreListState current) {
              // if (current is GenreListClickOnDetailsSuccess) {
              //   return (false);
              // }
              return (true);
            },
            builder: (context, state) {
              if (state is GenreListLoading) {
                return (const Center(
                  child: CircularProgressIndicator(),
                ));
              } else if (state is GenreListLoadedSuccess) {
                return (RefreshIndicator(
                    onRefresh: () async {
                      bloc.dispatch(GenreListLoadEvent());
                    },
                    child: GenreFilteredMovieListView(
                      bloc: bloc,
                      movies: state.movies,
                      filteredGenres: state.filteredGenres,
                    )));
              } else if (state is GenreListLoadedFailure) {
                return (Container());
              } else {
                return (Container());
              }
            }),
      ),
    );
  }
}
