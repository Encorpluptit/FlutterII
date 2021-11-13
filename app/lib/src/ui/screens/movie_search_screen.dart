import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/movie_list/movie_list_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/blocs/search/movie_search_bloc.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/widgets/movie_list.dart';

import 'movie_details_screen.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  _MovieSearchScreen createState() => _MovieSearchScreen();
}

class _MovieSearchScreen extends State<MovieSearchScreen> {
  MovieSearchBloc bloc = Provider.getBloc<MovieSearchBloc>() as MovieSearchBloc;

  @override
  void initState() {
    bloc.dispatch(MovieSearchWaitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: const Text('MyMovie - Search'),
          bottom: AppBar(
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child: Center(
                child: TextField(
                    onSubmitted: (value) =>
                        bloc.dispatch(MovieSearchFetchEvent(value)),
                    decoration: const InputDecoration(
                      hintText: 'Search for something',
                      prefixIcon: Icon(Icons.search),
                    )),
              ),
            ),
          )),
      body: BlocListener<MovieSearchBloc, MovieSearchState>(
        bloc: bloc,
        shouldBuild: (_) {
          return (true);
        },
        listener: (BuildContext context, MovieSearchState state) {
          if (state is MovieSearchClickOnDetailsSuccess) {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => MovieDetailsScreen(id: state.id)));
          }
        },
        child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
            bloc: bloc,
            shouldBuild: (MovieSearchState current) {
              if (current is MovieSearchClickOnDetailsSuccess) {
                return (false);
              }
              if (current is MovieSearchLoading) {
                return (false);
              }
              return (true);
            },
            builder: (context, state) {
              print(state);
              if (state is MovieSearchLoading) {
                return (const Center(
                  child: CircularProgressIndicator(),
                ));
              } else if (state is MovieSearchLoadedSuccess) {
                return (MovieListView(
                  movies: state.movies,
                  onSearch: (String movie_id) =>
                      Provider.getBloc<MovieSearchBloc>()
                          .dispatch(MovieSearchClickOnDetails(movie_id)),
                ));
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
