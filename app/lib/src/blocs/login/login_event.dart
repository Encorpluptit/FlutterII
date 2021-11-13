part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class LoginClickOnLogInEvent extends LoginEvent {}

class LoginClickOnRegisterEvent extends LoginEvent {}

class LoginClickOnRegisterDoneEvent extends LoginEvent {}
