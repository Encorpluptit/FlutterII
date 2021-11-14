import 'package:flutter/material.dart';
import 'package:movieapp/src/blocs/login/login_bloc.dart';
import 'package:movieapp/src/blocs/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'MyMovie',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Username",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                            controller: usernameController,
                            obscureText: false,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: true))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: true))
                      ],
                    ),
                  )
                ],
              ),
              InkWell(
                  onTap: () {
                    Provider.getBloc<LoginBloc>().dispatch(
                        LoginClickOnLogInEvent(
                            usernameController.text, passwordController.text));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.blue,
                          Colors.blue.shade900,
                        ],
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
              SizedBox(height: height * .055),
              InkWell(
                onTap: () {
                  Provider.getBloc<LoginBloc>()
                      .dispatch(LoginClickOnRegisterEvent());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Don\'t have an account ?',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
