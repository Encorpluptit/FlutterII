part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class LoginClickOnLogInEvent extends LoginEvent {
  final String username;
  final String password;

  const LoginClickOnLogInEvent(this.username, this.password);
}

class LoginClickOnLogInDoneEvent extends LoginEvent {}

class LoginClickOnRegisterEvent extends LoginEvent {}

class LoginClickOnRegisterDoneEvent extends LoginEvent {}
