part of 'playlist_cubit.dart';

@immutable
sealed class PlaylistState {}

final class PlaylistInitial extends PlaylistState {}

final class PlaylistLoading extends PlaylistState {}
final class PlaylistSuccess extends PlaylistState {
  final List<SongModel> songs;

  PlaylistSuccess({required this.songs});

}
final class PlaylistFailure extends PlaylistState {
  final String message; 

  PlaylistFailure({required this.message});
}
