part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String fullName;

  SignUpEvent({
    required this.email,
    required this.password,
    required this.fullName,
  });
}
