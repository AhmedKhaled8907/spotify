import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecases/usecase.dart';
import 'package:spotify/features/data/models/auth/create_user_model.dart';
import 'package:spotify/features/domain/repos/auth/auth_repo.dart';

import '../../../../core/utils/constants/service_locator.dart';

class SignupUseCase extends UseCase<Either, CreateUserModel> {
  @override
  Future<Either<String , CreateUserModel>> call({CreateUserModel? param}) async {
    return await sl<AuthRepo>().signUp(param!);
  }
}
