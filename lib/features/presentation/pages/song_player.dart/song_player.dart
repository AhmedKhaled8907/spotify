import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';
import 'package:spotify/core/utils/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify/features/data/models/song/song_model.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/constants_manager.dart';

class SongPlayer extends StatelessWidget {
  const SongPlayer({
    super.key,
    required this.model,
  });

  final SongModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          AppStrings.nowPlaying,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
          color: context.isDarkMode ? AppColors.white : AppColors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p24,
          horizontal: AppPadding.p16,
        ),
        child: _songPlayerItem(context),
      ),
    );
  }

  Widget _songPlayerItem(
    BuildContext context,
  ) {
    final imageUrl = AppUrl.fireStoreImage(model.artist);
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s30),
            image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: AppSize.s16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline_rounded,
                size: AppSize.s24,
              ),
              color: AppColors.grey,
            ),
          ],
        ),
        Text(
          model.artist,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.normal,
                color: context.isDarkMode ? AppColors.grey : AppColors.black,
              ),
        ),
      ],
    );
  }
}
