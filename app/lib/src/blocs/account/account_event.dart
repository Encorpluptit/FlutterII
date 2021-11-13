part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {
  const AccountEvent();
}

class AccountClickOnLogInEvent extends AccountEvent {}

class AccountClickOnRegisterEvent extends AccountEvent {}
