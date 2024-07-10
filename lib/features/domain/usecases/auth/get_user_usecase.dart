import 'package:dartz/dartz.dart';
import 'package:spotify/features/domain/repos/auth/auth_repo.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/constants/service_locator.dart';

class GetUserUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<AuthRepo>().getUser();
  }
}
