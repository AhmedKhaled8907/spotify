import 'package:dartz/dartz.dart';
import 'package:spotify/features/domain/repos/song/song_repo.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../service_locator.dart';

class GetNewsUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<SongRepo>().getNewSongs();
  }
}
