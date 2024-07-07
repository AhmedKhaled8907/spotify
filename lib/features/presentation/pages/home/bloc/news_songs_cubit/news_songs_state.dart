part of 'news_songs_cubit.dart';

@immutable
sealed class NewsSongsState {}

final class NewsSongsInitial extends NewsSongsState {}
final class NewsSongsLoading extends NewsSongsState {}
final class NewsSongsSuccess extends NewsSongsState {
  final List<SongModel> songs;

  NewsSongsSuccess({required this.songs});

}
final class NewsSongsFailure extends NewsSongsState {
  final String message; 

  NewsSongsFailure({required this.message});
}
