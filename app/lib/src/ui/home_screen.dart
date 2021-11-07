import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/blocs/movie_list/movie_list_bloc.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';
import 'package:movieapp/src/ui/widgets/movie_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const HomeAppBar(),
        body: BlocListener<MovieListBloc, MovieListState>(
            listener: (context, state) {
          if (state is MovieListFailure) {
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
          } else if (state is MovieListSuccess) {
            return (Container(
                color: Colors.white,
                child: MovieListView(movies: state.movies)));
          } else if (state is MovieListFailure) {
            return (Container());
          } else {
            return (Container());
          }
        })));
  }
}
