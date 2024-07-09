import 'package:dartz/dartz.dart';

import '../../../../core/utils/constants/service_locator.dart';
import '../../../domain/repos/song/song_repo.dart';
import '../../models/song/song_model.dart';
import '../../sources/song/song_firebase_service.dart';

class SongRepoImpl implements SongRepo {
  @override
  Future<Either<String, List<SongModel>>> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewSongs();
  }

  @override
  Future<Either<String, List<SongModel>>> getPlaylist() async {
    return await sl<SongFirebaseService>().getPlaylist();
  }

  @override
  Future<Either<String, bool>> addOrRemoveFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }
}
