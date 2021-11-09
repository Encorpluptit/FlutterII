part of 'routes_bloc.dart';

@immutable
abstract class RoutesEvent {
  const RoutesEvent();
}

class RoutesRedirectEvent extends RoutesEvent {
  final String page;

  const RoutesRedirectEvent(this.page);
}

class RoutesWaitingEvent extends RoutesEvent {
  const RoutesWaitingEvent();
}
