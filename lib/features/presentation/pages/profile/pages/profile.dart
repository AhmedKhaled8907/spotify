import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/assets.dart';
import 'package:spotify/core/utils/constants/custom_loading_indicator.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';
import 'package:spotify/core/utils/resources/color_manager.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify/features/data/models/song/song_model.dart';
import 'package:spotify/features/presentation/pages/profile/pages/cubits/favorite_songs_cubit/favorite_songs_cubit.dart';
import 'package:spotify/features/presentation/pages/profile/pages/cubits/profile_info_cubit/profile_info_cubit.dart';

import '../../../../../core/utils/resources/constants_manager.dart';
import '../../../../../core/utils/resources/route_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../../../../core/utils/widgets/favorite_button/favorite_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Scaffold(
        appBar: BasicAppBar(
          backgroundColor:
              context.isDarkMode ? AppColors.darkGrey : AppColors.lightBackBg,
          title: Text(
            AppStrings.profile,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          action: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
        body: SingleChildScrollView(
          child: FadeInRight(
            duration: const Duration(milliseconds: AppDuration.d500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileInfo(context),
                _favoriteSongs(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _profileInfo(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.23,
        width: double.infinity,
        decoration: BoxDecoration(
          color:
              context.isDarkMode ? AppColors.darkGrey : AppColors.lightBackBg,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppRadius.r75),
            bottomRight: Radius.circular(AppRadius.r75),
          ),
        ),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
          builder: (context, state) {
            if (state is ProfileInfoLoading) {
              return const CustomLoadingIndicator();
            } else if (state is ProfileInfoLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: AppSize.s100,
                    width: AppSize.s100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.transparent,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.r50),
                      child: CachedNetworkImage(
                        imageUrl: state.user.image ?? Assets.imagesProfilePic,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s8),
                  Text(
                    state.user.email,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    state.user.name ?? '',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              );
            } else if (state is ProfileInfoFailure) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ));
  }

  Widget _favoriteSongs(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s18,
          vertical: AppPadding.p24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.favoriteSongs,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSize.s16),
            BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
              builder: (context, state) {
                if (state is FavoriteSongsLoading) {
                  return const CustomLoadingIndicator();
                } else if (state is FavoriteSongsSuccess) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        _songTile(state.songs[index], context),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: AppSize.s16,
                    ),
                    itemCount: state.songs.length,
                  );
                } else if (state is FavoriteSongsFailure) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  _songTile(SongModel model, BuildContext context) {
    final imageUrl = AppUrl.fireStoreImage(model.artist);

    return InkWell(
      borderRadius: BorderRadius.circular(AppSize.s16),
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.songPlayerRoute,
          arguments: model,
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  height: AppSize.s72,
                  width: AppSize.s72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r16),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: AppSize.s16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        model.artist,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSize.s16),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.time
                      .toStringAsFixed(AppSelectedIndex.i2)
                      .replaceAll('.', ':'),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                FavoriteButton(
                  isFavorite: model.isFavorite ?? false,
                  songId: model.songId!,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
