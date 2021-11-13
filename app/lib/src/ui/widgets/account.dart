import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/account/account_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
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
      return (Scaffold(
          body: Center(
        child: Column(
          children: [
            const Text(
              "Welcome Guest",
              style: TextStyle(fontSize: 20),
            ),
            OutlinedButton(
              onPressed: () {
                Provider.getBloc<AccountBloc>()
                    .dispatch(AccountClickOnLogInEvent());
              },
              child: const Text('Login'),
            ),
            OutlinedButton(
              onPressed: () {
                Provider.getBloc<AccountBloc>()
                    .dispatch(AccountClickOnRegisterEvent());
              },
              child: const Text('Register'),
            ),
          ],
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
