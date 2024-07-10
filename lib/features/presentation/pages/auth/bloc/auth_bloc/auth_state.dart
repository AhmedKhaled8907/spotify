part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class SignupSuccess extends AuthState {
  final CreateUserModel user;

  SignupSuccess({required this.user});
}

class SigninSuccess extends AuthState {
  final UserModel user;

  SigninSuccess({required this.user});
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}
