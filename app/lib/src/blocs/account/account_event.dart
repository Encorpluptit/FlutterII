part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {
  const AccountEvent();
}

class AccountClickOnLogInEvent extends AccountEvent {}

class AccountClickOnRegisterEvent extends AccountEvent {}

class AccountBackToMainEvent extends AccountEvent {}

class AccountLoggedInEvent extends AccountEvent {
  final String username;

  const AccountLoggedInEvent(this.username);
}

class AccountClickOnLogOutEvent extends AccountEvent {}
