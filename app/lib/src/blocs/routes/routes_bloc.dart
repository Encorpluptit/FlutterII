import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/models/movie.dart';

part 'routes_bloc_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc() : super(RoutesWaiting());

  @override
  Stream<RoutesState> mapEventToState(RoutesEvent event) async* {
    if (event is RoutesRedirectEvent) {
      yield* _RoutesRedirect(event);
    }
    if (event is RoutesWaitingEvent) {
      yield* _RoutesWaiting();
    }
  }

  Stream<RoutesState> _RoutesRedirect(RoutesRedirectEvent event) async* {
    yield RoutesRedirect(event.page);
  }

  Stream<RoutesState> _RoutesWaiting() async* {
    yield RoutesWaiting();
  }
}
