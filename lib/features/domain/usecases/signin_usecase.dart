import 'package:dartz/dartz.dart';

import '../../../core/usecases/usecase.dart';
import '../../../service_locator.dart';
import '../../data/models/auth/user_model.dart';
import '../../data/sources/auth/auth_firebase_service.dart';

class SigninUseCase extends UseCase<Either, UserModel> {
  @override
  Future<Either<String , UserModel>> call({UserModel? param}) async {
    return await sl<AuthFirebaseService>().signIn(param!);
  }
}