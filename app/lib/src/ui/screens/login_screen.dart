import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/account/account_bloc.dart';
import 'package:movieapp/src/blocs/login/login_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/screens/register_screen.dart';
import 'package:movieapp/src/ui/widgets/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc = Provider.getBloc<LoginBloc>() as LoginBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('MyMovie - Login'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        bloc: bloc,
        listener: (BuildContext context, LoginState state) {
          if (state is LoginError) {
            var snackBar = SnackBar(
              duration: const Duration(minutes: 5),
              content: Text(state.cause),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is LoginLoggedIn) {
            bloc.dispatch(LoginClickOnLogInDoneEvent());
            Navigator.pop(context);
            Provider.getBloc<AccountBloc>()
                .dispatch(AccountLoggedInEvent(state.username));
          }
          if (state is LoginClickOnRegister) {
            Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) => const RegisterScreen()));
            bloc.dispatch(LoginClickOnRegisterDoneEvent());
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
            bloc: bloc,
            shouldBuild: (LoginState current) {
              if (current is LoginClickOnLogIn ||
                  current is LoginClickOnRegister) {
                return (false);
              }
              return (true);
            },
            builder: (context, state) {
              if (state is LoginLoggingIn) {
                return (const Center(
                  child: LoginView(),
                ));
              } else {
                return (Container());
              }
            }),
      ),
    );
  }
}
