import 'package:dartz/dartz.dart';

import '../../../../service_locator.dart';
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
}
