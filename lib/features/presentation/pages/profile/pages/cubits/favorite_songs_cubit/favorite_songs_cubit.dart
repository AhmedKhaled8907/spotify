import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/domain/usecases/song/get_user_favorite_songs_usecase.dart';

import '../../../../../../../core/utils/constants/service_locator.dart';
import '../../../../../../data/models/song/song_model.dart';

part 'favorite_songs_state.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsInitial());

  List<SongModel> favoriteSongs = [];
  Future<void> getFavoriteSongs() async {
    emit(FavoriteSongsLoading());
    var result = await sl<GetUserFavoriteSongsUsecase>().call();
    result.fold(
      (l) => emit(FavoriteSongsFailure(message: l)),
      (songs) {
        favoriteSongs = songs;
        emit(
          FavoriteSongsSuccess(songs: favoriteSongs),
        );
      },
    );
  }
}
