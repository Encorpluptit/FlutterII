import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/login/login_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/widgets/home_app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc = Provider.getBloc<LoginBloc>() as LoginBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocListener<LoginBloc, LoginState>(
          bloc: bloc,
          listener: (context, state) {},
          child: const Text("Login")),
    );
  }
}
