import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterState, RegisterEvent> {
  final Repository repository = Repository();

  RegisterBloc() : super(RegisterRegistering());

  @override
  Future<void> mapEventToState(Object event) async {
    if (event is RegisterClickOnLogInEvent) {
      setState(RegisterClickOnLogIn());
    }
    if (event is RegisterClickOnLoginDoneEvent) {
      setState(RegisterRegistering());
    }
    if (event is RegisterClickOnRegisterEvent) {
      setState(await _RegisterClickOnRegister(event));
    }
  }

  Future<RegisterState> _RegisterClickOnRegister(
      RegisterClickOnRegisterEvent event) async {
    try {
      return RegisterRegistered();
    } on Exception catch (error) {
      return RegisterError(error.toString());
    }
  }
}
