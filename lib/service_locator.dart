import 'package:get_it/get_it.dart';
import 'package:spotify/features/data/repos/auth/auth_repo_impl.dart';
import 'package:spotify/features/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/features/domain/repos/auth/auth_repo.dart';
import 'package:spotify/features/domain/usecases/signin_usecase.dart';
import 'package:spotify/features/domain/usecases/signup_usecase.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(),
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );
}
