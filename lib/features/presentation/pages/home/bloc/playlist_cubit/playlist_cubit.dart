import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/constants/service_locator.dart';
import '../../../../../data/models/song/song_model.dart';
import '../../../../../domain/usecases/song/get_playlist_usecase.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

  Future<void> getPlaylist() async {
    emit(PlaylistLoading());
    var songs = await sl<GetPlaylistUsecase>().call();

    songs.fold(
      (l) => emit(PlaylistFailure(message: l)),
      (songs) => emit(PlaylistSuccess(songs: songs)),
    );
  }
}
