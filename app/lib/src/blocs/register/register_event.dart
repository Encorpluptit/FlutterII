part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterClickOnLogInEvent extends RegisterEvent {}

class RegisterClickOnRegisterEvent extends RegisterEvent {
  final String username;
  final String email;
  final String password;

  const RegisterClickOnRegisterEvent(this.username, this.email, this.password);
}

class RegisterClickOnLoginDoneEvent extends RegisterEvent {}
