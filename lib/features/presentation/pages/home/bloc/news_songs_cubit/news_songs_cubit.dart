import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/domain/usecases/song/get_news_usecase.dart';
import 'package:spotify/core/utils/constants/service_locator.dart';

import '../../../../../data/models/song/song_model.dart';

part 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    emit(NewsSongsLoading());
    var songs = await sl<GetNewsSongsUsecase>().call();

    songs.fold(
      (l) => emit(NewsSongsFailure(message: l)),
      (songs) => emit(NewsSongsSuccess(songs: songs)),
    );
  }
}
