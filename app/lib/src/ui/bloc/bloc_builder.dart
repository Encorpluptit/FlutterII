import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/bloc.dart';

typedef ShouldBuild<S> = bool Function(S state);
typedef Listener<S> = void Function(BuildContext context, S state);
typedef Builder<S> = Widget Function(BuildContext context, S state);

class BlocListener<B extends BlocControllerState<S>, S> extends StatefulWidget {
  final B bloc;
  final Widget child;
  final Listener<S>? listener;
  final ShouldBuild<S>? shouldBuild;

  const BlocListener(
      {Key? key,
      required this.bloc,
      required this.child,
      this.listener,
      this.shouldBuild})
      : super(key: key);

  @override
  _BlocListener<B, S> createState() => _BlocListener<B, S>();
}

class _BlocListener<B extends BlocControllerState<S>, S>
    extends State<BlocListener<B, S>> {
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

  void _listen() {
    if (widget.listener != null) {
      listener = widget.bloc.output.listen((state) {
        if (widget.shouldBuild?.call(state) ?? true) {
          widget.listener!(context, state);
        }
      });
    }
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }
}

class BlocBuilder<B extends BlocControllerState<S>, S> extends StatefulWidget {
  final B bloc;
  final Builder<S> builder;
  final ShouldBuild<S>? shouldBuild;

  const BlocBuilder(
      {Key? key, required this.bloc, required this.builder, this.shouldBuild})
      : super(key: key);

  @override
  _BlocBuilder<B, S> createState() => _BlocBuilder<B, S>();

  Widget build(BuildContext context, S state) => builder(context, state);
}

class _BlocBuilder<B extends BlocControllerState<S>, S>
    extends State<BlocBuilder<B, S>> {
  late S _state;

  @override
  void initState() {
    super.initState();
    _state = widget.bloc.lastState;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      bloc: widget.bloc,
      shouldBuild: widget.shouldBuild,
      listener: (context, state) => setState(() => _state = state),
      child: widget.build(context, _state),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
