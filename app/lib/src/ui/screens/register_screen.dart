import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/provider.dart';
import 'package:movieapp/src/blocs/register/register_bloc.dart';
import 'package:movieapp/src/ui/bloc/bloc_builder.dart';
import 'package:movieapp/src/ui/screens/login_screen.dart';
import 'package:movieapp/src/ui/widgets/register.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc bloc = Provider.getBloc<RegisterBloc>() as RegisterBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('MyMovie - Register'),
      ),
      body: BlocListener<RegisterBloc, RegisterState>(
        bloc: bloc,
        listener: (BuildContext context, RegisterState state) async {
          if (state is RegisterError) {
            var snackBar = SnackBar(
              duration: const Duration(minutes: 5),
              content: Text(state.cause),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is RegisterClickOnLogIn) {
            Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => const LoginScreen()));
            bloc.dispatch(RegisterClickOnLoginDoneEvent());
          }
          if (state is RegisterClickOnRegister) {
            bloc.dispatch(RegisterClickOnRegisterEvent(
                state.email, state.username, state.password));
          }
          if (state is RegisterRegistered) {
            CupertinoPageRoute loginScreenRoute =
                CupertinoPageRoute(builder: (context) => const LoginScreen());
            bloc.dispatch(RegisterClickOnRegisterDoneEvent());
            await Navigator.pushReplacement(context, loginScreenRoute);
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
            bloc: bloc,
            shouldBuild: (RegisterState current) {
              if (current is RegisterClickOnLogIn ||
                  current is RegisterClickOnRegister) {
                return (false);
              }
              return (true);
            },
            builder: (context, state) {
              if (state is RegisterRegistering) {
                return (const Center(
                  child: RegisterView(),
                ));
              } else {
                return (Container());
              }
            }),
      ),
    );
  }
}
