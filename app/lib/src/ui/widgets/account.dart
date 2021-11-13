import 'package:flutter/material.dart';
import 'package:movieapp/src/models/movie.dart';

import 'movie_item.dart';

class AccountView extends StatefulWidget {
  final bool loggedIn;
  final String username;
  const AccountView({Key? key, required this.loggedIn, required this.username})
      : super(key: key);

  @override
  State createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    if (!widget.loggedIn) {
      return (const Scaffold(
          body: Center(
        child: Text(
          "Welcome Guest",
          style: TextStyle(fontSize: 20),
        ),
      )));
    } else {
      return (Scaffold(
          body: Center(
        child: Text(
          'Welcome ${widget.username}',
          style: const TextStyle(fontSize: 20),
        ),
      )));
    }
  }
}
