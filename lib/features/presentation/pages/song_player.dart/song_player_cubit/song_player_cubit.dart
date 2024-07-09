import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
      updateSongPlayer();
    });
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
    });
  }

  void updateSongPlayer() {
    emit(SongPlayerSuccess());
  }

  Future<void> loadPlayer(String url) async {
    try {
      await audioPlayer.setUrl(url);
      await audioPlayer.play();
      emit(SongPlayerSuccess());
    } on Exception catch (e) {
      emit(
        SongPlayerFailure(
          message: e.toString(),
        ),
      );
    }
  }

  void seekTo(double value) {
    final position = Duration(seconds: value.toInt());
    audioPlayer.seek(position);
  }

  void playOrPause() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play();
    }
    emit(SongPlayerSuccess());
  }

  @override
  Future<void> close() async {
    await audioPlayer.dispose();
    return super.close();
  }
}
