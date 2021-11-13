part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {
  const RegisterEvent();
}

class RegisterClickOnLogInEvent extends RegisterEvent {}

class RegisterClickOnRegisterEvent extends RegisterEvent {}

class RegisterClickOnLoginDoneEvent extends RegisterEvent {}
