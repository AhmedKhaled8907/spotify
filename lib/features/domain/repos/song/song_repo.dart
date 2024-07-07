import 'package:dartz/dartz.dart';

import '../../../data/models/song/song_model.dart';

abstract class SongRepo {
  Future<Either<String, List<SongModel>>> getNewSongs();
}
