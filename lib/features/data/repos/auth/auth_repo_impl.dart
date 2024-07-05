import 'package:dartz/dartz.dart';
import 'package:spotify/features/data/models/auth/create_user_model.dart';
import 'package:spotify/features/data/sources/auth/auth_firebase_service.dart';

import '../../../../service_locator.dart';
import '../../../domain/repos/auth/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<String, CreateUserModel>> signUp(CreateUserModel model) async {
    return await sl<AuthFirebaseService>().signUp(model);
  }
}
