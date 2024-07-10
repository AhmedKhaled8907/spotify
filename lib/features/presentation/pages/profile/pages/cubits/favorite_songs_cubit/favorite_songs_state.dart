part of 'favorite_songs_cubit.dart';

@immutable
sealed class FavoriteSongsState {}

final class FavoriteSongsInitial extends FavoriteSongsState {}

final class FavoriteSongsLoading extends FavoriteSongsState {}

final class FavoriteSongsSuccess extends FavoriteSongsState {
  final List<SongModel> songs;

  FavoriteSongsSuccess({required this.songs});
}

final class FavoriteSongsFailure extends FavoriteSongsState {
  final String message;

  FavoriteSongsFailure({required this.message});
}
