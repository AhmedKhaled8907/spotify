import 'package:dartz/dartz.dart';
import 'package:spotify/features/domain/repos/song/song_repo.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/constants/service_locator.dart';
import '../../../data/models/song/song_model.dart';

class GetPlaylistUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either<String , List<SongModel>>> call({param}) async {
    return await sl<SongRepo>().getPlaylist();
  }
}
