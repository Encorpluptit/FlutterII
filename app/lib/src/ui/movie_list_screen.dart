import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/blocs/movie_list/movie_list_bloc.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';
import 'package:movieapp/src/ui/widgets/movie_list.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: BlocListener<MovieListBloc, MovieListState>(
            listener: (context, state) {
          if (state is MovieListLoadedFailure) {
            const snackBar = SnackBar(
              duration: Duration(minutes: 5),
              content: Text(
                  'Eror while retriving the movies. Please try again later.'),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }, child: BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, state) {
          if (state is MovieListLoading) {
            return (const CircularProgressIndicator());
          } else if (state is MovieListLoadedSuccess) {
            return (RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<MovieListBloc>(context)
                      .add(MovieListLoadEvent());
                },
                child: MovieListView(movies: state.movies)));
          } else if (state is MovieListLoadedFailure) {
            return (Container());
          } else {
            return (Container());
          }
        })));
  }
}
