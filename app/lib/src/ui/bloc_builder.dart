import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/bloc.dart';

typedef ShouldBuild<S> = bool Function(S state);
typedef Listener<S> = void Function(BuildContext context, S state);
typedef Builder<S> = void Function(BuildContext context, S state);

class BlocBuilder<B extends BlocControllerState<S>, S> extends StatefulWidget {
  final B bloc;
  final Widget child;
  final Listener<S>? listener;
  final ShouldBuild<S>? shouldBuild;

  const BlocBuilder(
      {Key? key,
      required this.bloc,
      required this.child,
      this.listener,
      this.shouldBuild})
      : super(key: key);

  @override
  _BlocBuilder<B, S> createState() => _BlocBuilder<B, S>();
}

class _BlocBuilder<B extends BlocControllerState<S>, S>
    extends State<BlocBuilder<B, S>> {
  late StreamSubscription<S> listener;

  @override
  void initState() {
    super.initState();
    _listen();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.child);
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  void _listen() {
    if (widget.listener != null) {
      listener = widget.bloc.output.listen((st) {
        if (widget.shouldBuild != null) {
          if (widget.shouldBuild?.call(st) ?? true) {
            widget.listener!(context, st);
          }
        }
      });
    }
  }
}
