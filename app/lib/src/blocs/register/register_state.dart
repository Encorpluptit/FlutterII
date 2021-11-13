part of 'register_bloc.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterLoggingIn extends RegisterState {
  RegisterLoggingIn();
}

class RegisterClickOnLogIn extends RegisterState {
  RegisterClickOnLogIn();
}

class RegisterClickOnRegister extends RegisterState {
  RegisterClickOnRegister();
}

class RegisterLoggedIn extends RegisterState {
  final String username;

  const RegisterLoggedIn(this.username);
}

class RegisterError extends RegisterState {
  String cause = "";

  RegisterError(this.cause);
}
