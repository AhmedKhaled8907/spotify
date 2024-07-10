import 'package:dartz/dartz.dart';
import 'package:spotify/features/data/models/auth/create_user_model.dart';
import 'package:spotify/features/data/sources/auth/auth_firebase_service.dart';

import '../../../../core/utils/constants/service_locator.dart';
import '../../../domain/repos/auth/auth_repo.dart';
import '../../models/auth/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<String, UserModel>> signIn(UserModel model) async {
    return await sl<AuthFirebaseService>().signIn(model);
  }

  @override
  Future<Either<String, CreateUserModel>> signUp(CreateUserModel model) async {
    return await sl<AuthFirebaseService>().signUp(model);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }
}
