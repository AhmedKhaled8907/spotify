import 'package:dartz/dartz.dart';
import 'package:spotify/features/data/models/auth/create_user_model.dart';
import 'package:spotify/features/data/models/auth/user_model.dart';

abstract class AuthRepo {
  Future<Either<String , CreateUserModel>> signUp(CreateUserModel model);
  Future<Either<String , UserModel>> signIn(UserModel model);
}
