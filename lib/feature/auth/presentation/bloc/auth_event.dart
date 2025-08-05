part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class AuthSignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const AuthSignUpEvent(this.name, this.email, this.password);

}

final class AuthLogInEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLogInEvent(this.email, this.password);

}

final class AuthIsUserLoggedInEvent extends AuthEvent {}
