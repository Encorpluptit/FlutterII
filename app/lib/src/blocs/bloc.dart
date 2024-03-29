import 'dart:async';

class BlocControllerState<_State> {
  final _controller = StreamController<_State>.broadcast();
  StreamSink<_State> get input => _controller.sink;
  Stream<_State> get output => _controller.stream;

  _State lastState;

  BlocControllerState(this.lastState);
}

abstract class Bloc<_State, _Event> extends BlocControllerState<_State> {
  final _eventController = StreamController<_Event>.broadcast();
  StreamController<_Event> get eventController => _eventController;
  Sink<_Event> get sink => _eventController.sink;

  void dispatch(_Event ev) {
    sink.add(ev);
  }

  void setState(_State st) {
    lastState = st;
    input.add(st);
  }

  Bloc(_State st) : super(st) {
    eventController.stream.listen(mapEventToState);
  }

  void mapEventToState(_Event event) {}
}
