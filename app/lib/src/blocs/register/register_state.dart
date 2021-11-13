part of 'register_bloc.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterRegistering extends RegisterState {
  RegisterRegistering();
}

class RegisterClickOnLogIn extends RegisterState {
  RegisterClickOnLogIn();
}

class RegisterClickOnRegister extends RegisterState {
  RegisterClickOnRegister();
}

class RegisterError extends RegisterState {
  String cause = "";

  RegisterError(this.cause);
}
