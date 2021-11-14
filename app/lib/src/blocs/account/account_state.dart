part of 'account_bloc.dart';

abstract class AccountState {
  const AccountState();
}

class AccountClickOnLogIn extends AccountState {
  AccountClickOnLogIn();
}

class AccountClickOnRegister extends AccountState {
  AccountClickOnRegister();
}

class AccountLoggedIn extends AccountState {
  final String username;

  const AccountLoggedIn(this.username);
}

class AccountGuest extends AccountState {
  AccountGuest();
}

class AccountError extends AccountState {
  String cause = "";

  AccountError(this.cause);
}
