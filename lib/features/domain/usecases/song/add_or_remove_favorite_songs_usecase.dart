import 'package:dartz/dartz.dart';
import 'package:spotify/features/domain/repos/song/song_repo.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/constants/service_locator.dart';

class AddOrRemoveFavoriteSongsUsecase extends UseCase<Either, String> {
  @override
  Future<Either<String , bool>> call({String? param}) async {
    return await sl<SongRepo>().addOrRemoveFavoriteSong(param!);
  }
}
