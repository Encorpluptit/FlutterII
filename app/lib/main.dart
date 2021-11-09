import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/blocs/movie_details/movie_details_bloc.dart';
import 'package:movieapp/src/blocs/movie_list/movie_list_bloc.dart';
import 'package:movieapp/src/blocs/routes/routes_bloc.dart';
import 'package:movieapp/src/ui/routes/main_routes.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) {
      return MovieListBloc()..add(MovieListLoadEvent());
    }),
    BlocProvider(create: (context) {
      return MovieDetailsBloc()..add(MovieDetailsLoadEvent());
    }),
    BlocProvider(create: (context) {
      return RoutesBloc()..add(RoutesRedirectEvent(NavigationRoutes[0].label));
    }),
  ], child: const MyApp()));
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
