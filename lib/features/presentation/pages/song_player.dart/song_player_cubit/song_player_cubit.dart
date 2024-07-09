import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;
  String? currentUrl; // Add this variable to track the current URL

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        songDuration = duration;
        updateSongPlayer();
      }
    });
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
    });
  }

  void updateSongPlayer() {
    emit(SongPlayerSuccess(
      duration: songDuration,
      position: songPosition,
      isPlaying: audioPlayer.playing,
    ));
  }

  Future<void> loadPlayer(String url) async {
    try {
      // Check if the URL is the same as the current URL and if the player is already playing
      if (currentUrl == url && audioPlayer.playing) {
        return; // Do nothing if the same song is already playing
      }

      emit(SongPlayerLoading());
      await audioPlayer.setUrl(url);
      currentUrl = url; // Update the current URL
      await audioPlayer.play();
      emit(SongPlayerSuccess(
        duration: songDuration,
        position: songPosition,
        isPlaying: audioPlayer.playing,
      ));
    } catch (e) {
      emit(SongPlayerFailure(message: e.toString()));
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
    emit(SongPlayerSuccess(
      duration: songDuration,
      position: songPosition,
      isPlaying: audioPlayer.playing,
    ));
  }

  @override
  Future<void> close() async {
    await audioPlayer.dispose();
    return super.close();
  }
}
