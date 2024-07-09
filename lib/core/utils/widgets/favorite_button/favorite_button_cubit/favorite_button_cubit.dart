import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/service_locator.dart';
import 'package:spotify/features/domain/usecases/song/add_or_remove_favorite_songs_usecase.dart';

part 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> updateFavoriteButton(String songId) async {
    var result = await sl<AddOrRemoveFavoriteSongsUsecase>().call(
      param: songId,
    );

    result.fold(
      (failure) {},
      (isFavorite) {
        return emit(
          FavoriteButtonUpdated(
            isFavorite: isFavorite,
            songId: songId,
          ),
        );
      },
    );
  }
}
