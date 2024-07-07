import 'package:get_it/get_it.dart';
import 'package:spotify/features/data/repos/auth/auth_repo_impl.dart';
import 'package:spotify/features/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/features/data/sources/song/song_firebase_service.dart';
import 'package:spotify/features/domain/repos/auth/auth_repo.dart';
import 'package:spotify/features/domain/repos/song/song_repo.dart';
import 'package:spotify/features/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify/features/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify/features/domain/usecases/song/get_news_usecase.dart';

import 'features/data/repos/song/song_repo_impl.dart';

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

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  sl.registerSingleton<SongRepo>(
    SongRepoImpl(),
  );

  sl.registerSingleton<GetNewsSongsUsecase>(
    GetNewsSongsUsecase(),
  );
}
