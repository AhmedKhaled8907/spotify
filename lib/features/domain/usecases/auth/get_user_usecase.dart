import 'package:dartz/dartz.dart';
import 'package:spotify/features/data/sources/auth/auth_firebase_service.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/constants/service_locator.dart';

class GetUserUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<AuthFirebaseService>().getUser();
  }
}
