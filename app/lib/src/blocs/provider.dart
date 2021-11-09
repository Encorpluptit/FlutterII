library mymovie.blocs;

import 'package:movieapp/src/blocs/bloc.dart';

class BlocProvider {
  List<Bloc> blocs = [];

  BlocProvider();

  Bloc getBloc<Element>() {
    for (Bloc element in blocs) {
      if (element is Element) {
        return element;
      }
    }
    throw Exception("Bloc not found, check if you have init it in main.");
  }
}

var Provider = BlocProvider();
