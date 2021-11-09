import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/bloc.dart';

typedef Listener<S> = void Function(BuildContext context, S state);
typedef Builder<S> = void Function(BuildContext context, S state);

class BlocBuilder<B extends BlocControllerState<S>, S> extends StatefulWidget {
  final B bloc;
  final Widget child;
  final Listener<S> listener;

  const BlocBuilder({
    Key? key,
    required this.bloc,
    required this.child,
    required this.listener,
  }) : super(key: key);

  @override
  _BlocBuilder<B, S> createState() => _BlocBuilder<B, S>();
}

class _BlocBuilder<B extends BlocControllerState<S>, S>
    extends State<BlocBuilder<B, S>> {
  late StreamSubscription<S> listener;

  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.child);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _subscribe() {
    listener = widget.bloc.output.listen((st) {
      widget.listener(context, st);
    });
  }
}
