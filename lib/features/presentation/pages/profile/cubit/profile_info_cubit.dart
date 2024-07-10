import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/service_locator.dart';
import 'package:spotify/features/data/models/auth/user_model.dart';

import '../../../../domain/usecases/auth/get_user_usecase.dart';

part 'profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoInitial());

  Future<void> getUser() async {
    emit(ProfileInfoLoading());
    var result = await sl<GetUserUsecase>().call();
    result.fold(
      (l) => emit(ProfileInfoFailure(message: l)),
      (model) => emit(ProfileInfoLoaded(user: model)),
    );
  }
}
