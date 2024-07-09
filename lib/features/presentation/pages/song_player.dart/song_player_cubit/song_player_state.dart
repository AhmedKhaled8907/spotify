part of 'song_player_cubit.dart';

abstract class SongPlayerState {}

class SongPlayerLoading extends SongPlayerState {}

class SongPlayerSuccess extends SongPlayerState {
  final Duration duration;
  final Duration position;
  final bool isPlaying;

  SongPlayerSuccess({
    required this.duration,
    required this.position,
    required this.isPlaying,
  });
}

class SongPlayerFailure extends SongPlayerState {
  final String message;

  SongPlayerFailure({required this.message});
}
