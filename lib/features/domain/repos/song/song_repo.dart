import 'package:dartz/dartz.dart';

import '../../../data/models/song/song_model.dart';

abstract class SongRepo {
  Future<Either<String, List<SongModel>>> getNewSongs();
  Future<Either<String, List<SongModel>>> getPlaylist();
  Future<Either<String, bool>> addOrRemoveFavoriteSong(
    String songId,
  );
  Future<bool> isFavoriteSong(String songId);
}
