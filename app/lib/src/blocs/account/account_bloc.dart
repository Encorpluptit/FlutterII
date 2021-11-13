import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/src/blocs/bloc.dart';
import 'package:movieapp/src/resources/repository.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountState, AccountEvent> {
  final Repository repository = Repository();

  AccountBloc() : super(AccountGuest());

  @override
  Future<void> mapEventToState(Object event) async {
    if (event is AccountClickOnLogInEvent) {
      setState(AccountClickOnLogIn());
    }
    if (event is AccountClickOnRegisterEvent) {
      setState(AccountClickOnRegister());
    }
    if (event is AccountBackToMainEvent) {
      setState(AccountGuest());
    }
  }
}
