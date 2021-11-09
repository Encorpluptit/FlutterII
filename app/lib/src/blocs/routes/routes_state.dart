part of 'routes_bloc.dart';

abstract class RoutesState {
  const RoutesState();
}

class RoutesWaiting extends RoutesState {
  RoutesWaiting();
}

class RoutesRedirect extends RoutesState {
  final String page;

  const RoutesRedirect(this.page);
}
