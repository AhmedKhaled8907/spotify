part of 'favorite_button_cubit.dart';

@immutable
abstract class FavoriteButtonState {}

class FavoriteButtonInitial extends FavoriteButtonState {}

class FavoriteButtonUpdated extends FavoriteButtonState {
  final String songId;
  final bool isFavorite;

  FavoriteButtonUpdated({
    required this.songId,
    required this.isFavorite,
  });
}
