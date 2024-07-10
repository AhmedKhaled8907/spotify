import 'package:dartz/dartz.dart';
import 'package:spotify/features/domain/repos/auth/auth_repo.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/constants/service_locator.dart';
import '../../../data/models/auth/user_model.dart';

class SigninUseCase extends UseCase<Either, UserModel> {
  @override
  Future<Either<String , UserModel>> call({UserModel? param}) async {
    return await sl<AuthRepo>().signIn(param!);
  }
}