import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/blocs/movie_details/movie_details_bloc.dart';
import 'package:movieapp/src/blocs/movie_list/movie_list_bloc.dart';
import 'package:movieapp/src/blocs/routes/routes_bloc.dart';
import 'package:movieapp/src/ui/routes/main_routes.dart';
import 'package:movieapp/src/blocs/provider.dart';

class BlocInit {
  Bloc bloc;
  Object? initialEvent;

  BlocInit(this.bloc, this.initialEvent);
}

void addBlocs(List<BlocInit> blocs) {
  for (var element in blocs) {
    Provider.addBloc(element.bloc, element.initialEvent);
  }
}

void main() {
  addBlocs([
    BlocInit(MovieListBloc(), MovieListLoadEvent()),
    BlocInit(RoutesBloc(), null),
    BlocInit(MovieDetailsBloc(), null),
  ].toList());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyMovie',
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.system,
        home: const MainRoutes());
  }
}
