import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/movie_details/movie_details_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';
import 'package:movieapp/src/ui/widgets/movie_details.dart';

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
  void initState() {
    bloc.dispatch(MovieDetailsLoadEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('MyMovie - Details'),
      ),
      body: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        bloc: bloc,
        shouldBuild: (_) => true,
        listener: (BuildContext context, MovieDetailsState state) {
          if (state is MovieDetailsLoadedFailure) {
            var snackBar = SnackBar(
              duration: const Duration(minutes: 5),
              content: Text(state.cause),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'Retry',
                onPressed: () {
                  bloc.dispatch(MovieDetailsLoadEvent(widget.id));
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            bloc: bloc,
            shouldBuild: (_) => true,
            builder: (context, state) {
              if (state is MovieDetailsLoading) {
                return (const Center(
                  child: CircularProgressIndicator(),
                ));
              } else if (state is MovieDetailsLoadedSuccess) {
                return (RefreshIndicator(
                    onRefresh: () async {
                      bloc.dispatch(MovieDetailsLoadEvent(widget.id));
                    },
                    child: MovieDetailsView(movie: state.movie)));
              } else if (state is MovieDetailsLoadedFailure) {
                return (Container());
              } else {
                return (Container());
              }
            }),
      ),
    );
  }
}
