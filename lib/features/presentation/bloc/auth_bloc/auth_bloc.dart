import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/data/models/auth/create_user_model.dart';

import '../../../../service_locator.dart';
import '../../../domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(_getSignUp);
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
      (r) => emit(AuthSuccess(user: r)),
    );
  }
}
