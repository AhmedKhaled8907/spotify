import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/data/models/auth/create_user_model.dart';
import 'package:spotify/features/data/models/auth/user_model.dart';

import '../../../../service_locator.dart';
import '../../../domain/usecases/auth/signin_usecase.dart';
import '../../../domain/usecases/auth/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(_getSignUp);
    on<SigninEvent>(_getSignin);
  }

  FutureOr<void> _getSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    var result = await sl<SignupUseCase>().call(
      param: CreateUserModel(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (l) => emit(AuthFailure(message: l)),
      (r) => emit(SignupSuccess(user: r)),
    );
  }

  FutureOr<void> _getSignin(
    SigninEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    var result = await sl<SigninUseCase>().call(
      param: UserModel(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (l) => emit(AuthFailure(message: l)),
      (r) => emit(SigninSuccess(user: r)),
    );
  }
}
