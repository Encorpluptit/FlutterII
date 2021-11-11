import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/movie_details/movie_details_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String id;

  const MovieDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsBloc bloc =
      Provider.getBloc<MovieDetailsBloc>() as MovieDetailsBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocListener<MovieDetailsBloc, MovieDetailsState>(
          bloc: bloc,
          listener: (context, state) {},
          child: Text("Movie details ${widget.id}")),
    );
  }
}
