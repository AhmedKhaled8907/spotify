import 'package:spotify/features/domain/repos/song/song_repo.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/constants/service_locator.dart';

class IsFavoriteSongUsecase extends UseCase<bool, String> {
  @override
  Future<bool> call({String? param}) async {
    return await sl<SongRepo>().isFavoriteSong(param!);
  }
}
