import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginState, LoginEvent> {
  final Repository repository = Repository();

  LoginBloc() : super(LoginLoggingIn());

  @override
  Future<void> mapEventToState(Object event) async {
    if (event is LoginClickOnLogInEvent) {
      setState(await _LoginClickOnLogin(event));
    }
    if (event is LoginClickOnRegisterEvent) {
      setState(LoginClickOnRegister());
    }
    if (event is LoginClickOnRegisterDoneEvent ||
        event is LoginClickOnLogInDoneEvent) {
      setState(LoginLoggingIn());
    }
  }

  Future<LoginState> _LoginClickOnLogin(LoginClickOnLogInEvent event) async {
    try {
      return LoginLoggedIn(event.username);
    } on Exception catch (error) {
      return LoginError(error.toString());
    }
  }
}
