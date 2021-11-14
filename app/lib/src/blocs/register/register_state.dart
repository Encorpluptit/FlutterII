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
  final String email;
  final String username;
  final String password;

  RegisterClickOnRegister(this.email, this.username, this.password);
}

class RegisterRegistered extends RegisterState {
  final String username;
  final String password;

  RegisterRegistered(this.username, this.password);
}

class RegisterError extends RegisterState {
  String cause = "";

  RegisterError(this.cause);
}
