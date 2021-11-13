import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterState, RegisterEvent> {
  final Repository repository = Repository();

  RegisterBloc() : super(RegisterLoggingIn());

  @override
  Future<void> mapEventToState(Object event) async {
    if (event is RegisterClickOnLogInEvent) {
      setState(RegisterClickOnLogIn());
    }
    if (event is RegisterClickOnRegisterEvent) {
      setState(RegisterClickOnRegister());
    }
  }
}
