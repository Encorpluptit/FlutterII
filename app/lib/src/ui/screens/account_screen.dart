import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/account/account_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/screens/login_screen.dart';
import 'package:movieapp/src/ui/screens/register_screen.dart';
import 'package:movieapp/src/ui/widgets/account.dart';
// import 'package:movieapp/src/ui/widgets/account.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountBloc bloc = Provider.getBloc<AccountBloc>() as AccountBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('MyMovie - Account'),
      ),
      body: BlocListener<AccountBloc, AccountState>(
        bloc: bloc,
        listener: (BuildContext context, AccountState state) {
          if (state is AccountError) {
            var snackBar = SnackBar(
              duration: const Duration(minutes: 5),
              content: Text(state.cause),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is AccountClickOnLogIn) {
            // ignore: avoid_print
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => const LoginScreen()));
          }
          if (state is AccountClickOnRegister) {
            // ignore: avoid_print
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const RegisterScreen()));
          }
        },
        child: BlocBuilder<AccountBloc, AccountState>(
            bloc: bloc,
            shouldBuild: (AccountState current) {
              if (current is AccountClickOnLogIn ||
                  current is AccountClickOnRegister) {
                return (false);
              }
              return (true);
            },
            builder: (context, state) {
              if (state is AccountLoggedIn) {
                return (const Center(
                  child: Text('Welcome mister'),
                ));
              } else if (state is AccountGuest) {
                return (const Center(
                  child: AccountView(
                    loggedIn: false,
                    username: "",
                  ),
                ));
              } else {
                return (Container());
              }
            }),
      ),
    );
  }
}
