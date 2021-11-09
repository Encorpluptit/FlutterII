import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/blocs/movie_list/movie_list_bloc.dart';
import 'package:movieapp/src/ui/routes/main_routes.dart';
import 'package:movieapp/src/blocs/provider.dart';

void addBlocs(List<Bloc> blocs) {
  Provider.blocs = blocs;
}

void main() {
  addBlocs([
    MovieListBloc(),
  ]);
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
