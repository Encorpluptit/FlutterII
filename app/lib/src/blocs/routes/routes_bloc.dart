import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/models/movie.dart';

part 'routes_bloc_event.dart';
part 'routes_state.dart';

class RoutesBloc extends Bloc<RoutesState, RoutesEvent> {
  RoutesBloc() : super(RoutesWaiting());

  @override
  Future<void> mapEventToState(Object event) async {
    if (event is RoutesRedirectEvent) {
      setState(await _RoutesRedirect(event));
    }
    if (event is RoutesWaitingEvent) {
      setState(await _RoutesWaiting());
    }
  }

  Future<RoutesState> _RoutesRedirect(RoutesRedirectEvent event) async {
    return RoutesRedirect(event.page);
  }

  Future<RoutesState> _RoutesWaiting() async {
    return RoutesWaiting();
  }
}
