import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/blocs/movie_details/movie_details_bloc.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String id;

  const MovieDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {},
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
          //TODO
          return (Text("Movie details ${widget.id}"));
        }),
      ),
    );
  }
}
