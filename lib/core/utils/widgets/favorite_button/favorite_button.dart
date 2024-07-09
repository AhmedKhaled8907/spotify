import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';
import 'package:spotify/core/utils/widgets/favorite_button/favorite_button_cubit/favorite_button_cubit.dart';

import '../../resources/color_manager.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.songId,
    required this.isFavorite,
    this.size = AppSize.s25,
  });

  final String songId;
  final bool isFavorite;
  final double size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
      builder: (context, state) {
        bool currentIsFavorite = isFavorite;
        if (state is FavoriteButtonUpdated && state.songId == songId) {
          currentIsFavorite = state.isFavorite;
        }

        return InkWell(
          borderRadius: BorderRadius.circular(AppPadding.p16),
          onTap: () async {
            await context.read<FavoriteButtonCubit>().updateFavoriteButton(
                  songId,
                );
          },
          child: Icon(
            currentIsFavorite
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded,
            color: currentIsFavorite ? AppColors.redAccent : AppColors.grey,
            size: size,
          ),
        );
      },
    );
  }
}
