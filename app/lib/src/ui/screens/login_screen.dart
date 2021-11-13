import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/login/login_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/screens/register_screen.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';
import 'package:movieapp/src/ui/widgets/login.dart';
// import 'package:movieapp/src/ui/widgets/account.dart';

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
      appBar: const HomeAppBar(),
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
          if (state is LoginClickOnLogIn) {
            bloc.dispatch(LoginClickOnLogInEvent());
          }
          if (state is LoginClickOnRegister) {
            Navigator.pop(context);
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => const RegisterScreen())).then((_) {
              bloc.dispatch(LoginClickOnRegisterDoneEvent());
            });
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
              if (state is LoginLoggedIn) {
                return (const Center(
                  child: Text('Welcome mister'),
                ));
              }
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
