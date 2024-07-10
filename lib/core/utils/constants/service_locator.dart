import 'package:get_it/get_it.dart';
import 'package:spotify/core/utils/widgets/favorite_button/favorite_button_cubit/favorite_button_cubit.dart';
import 'package:spotify/features/data/repos/auth/auth_repo_impl.dart';
import 'package:spotify/features/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/features/data/sources/song/song_firebase_service.dart';
import 'package:spotify/features/domain/repos/auth/auth_repo.dart';
import 'package:spotify/features/domain/repos/song/song_repo.dart';
import 'package:spotify/features/domain/usecases/auth/get_user_usecase.dart';
import 'package:spotify/features/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify/features/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify/features/domain/usecases/song/add_or_remove_favorite_songs_usecase.dart';
import 'package:spotify/features/domain/usecases/song/get_news_usecase.dart';
import 'package:spotify/features/domain/usecases/song/get_playlist_usecase.dart';
import 'package:spotify/features/domain/usecases/song/get_user_favorite_songs_usecase.dart';
import 'package:spotify/features/domain/usecases/song/is_favorite_song_usecase.dart';

import '../../../features/data/repos/song/song_repo_impl.dart';
import '../../../features/presentation/pages/song_player.dart/song_player_cubit/song_player_cubit.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  sl.registerLazySingleton<AuthFirebaseService>(
    () => AuthFirebaseServiceImpl(),
  );

  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(),
  );

  sl.registerLazySingleton<SignupUseCase>(
    () => SignupUseCase(),
  );
  sl.registerLazySingleton<SigninUseCase>(
    () => SigninUseCase(),
  );

  sl.registerLazySingleton<SongFirebaseService>(
    () => SongFirebaseServiceImpl(),
  );

  sl.registerLazySingleton<SongRepo>(
    () => SongRepoImpl(),
  );

  sl.registerLazySingleton<GetNewsSongsUsecase>(
    () => GetNewsSongsUsecase(),
  );
  sl.registerLazySingleton<GetPlaylistUsecase>(
    () => GetPlaylistUsecase(),
  );
  sl.registerLazySingleton<AddOrRemoveFavoriteSongsUsecase>(
    () => AddOrRemoveFavoriteSongsUsecase(),
  );
  sl.registerLazySingleton<IsFavoriteSongUsecase>(
    () => IsFavoriteSongUsecase(),
  );
   sl.registerLazySingleton<GetUserUsecase>(
    () => GetUserUsecase(),
  );
  sl.registerLazySingleton<GetUserFavoriteSongsUsecase>(
    () => GetUserFavoriteSongsUsecase(),
  );

    sl.registerFactory(() => SongPlayerCubit());
    sl.registerFactory(() => FavoriteButtonCubit());

  
  
}

