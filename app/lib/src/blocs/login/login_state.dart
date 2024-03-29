part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();
}

class LoginLoggingIn extends LoginState {
  LoginLoggingIn();
}

class LoginClickOnLogIn extends LoginState {
  final String username;
  final String password;

  LoginClickOnLogIn(this.username, this.password);
}

class LoginClickOnRegister extends LoginState {
  LoginClickOnRegister();
}

class LoginLoggedIn extends LoginState {
  final String username;

  const LoginLoggedIn(this.username);
}

class LoginError extends LoginState {
  String cause = "";

  LoginError(this.cause);
}
