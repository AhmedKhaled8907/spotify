import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/custom_slider.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';
import 'package:spotify/core/utils/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify/features/data/models/song/song_model.dart';
import 'package:spotify/features/presentation/pages/song_player.dart/song_player_cubit/song_player_cubit.dart';

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
    final songTitle = AppUrl.fireStoreSong(model.title);

    return BlocProvider(
      create: (context) => SongPlayerCubit()..loadPlayer(songTitle),
      child: Scaffold(
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
        body: _songPlayerItem(context),
      ),
    );
  }

  Widget _songPlayerItem(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: AppDuration.d500),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p24,
          horizontal: AppPadding.p16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _songCover(context),
              const SizedBox(height: AppSize.s16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _songDetails(context),
                  const SizedBox(height: AppSize.s36),
                  _songPlayer(context),
                  const SizedBox(height: AppSize.s16),
                  _songLyrics(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songLyrics(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.lyrics,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_up_rounded,
            size: AppSize.s36,
          ),
          color: AppColors.grey,
        ),
      ],
    );
  }

  Column _songDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                size: AppSize.s36,
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

  Container _songCover(BuildContext context) {
    final imageUrl = AppUrl.fireStoreImage(model.artist);
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s30),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const Center(
            child: CustomSlider(),
          );
        }
        if (state is SongPlayerSuccess) {
          var cubit = context.read<SongPlayerCubit>();
          return Column(
            children: [
              Slider(
                onChanged: (value) {
                  cubit.seekTo(value);
                },
                value: cubit.songPosition.inSeconds.toDouble(),
                min: 0.0,
                max: cubit.songDuration.inSeconds.toDouble(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p4,
                  horizontal: AppPadding.p8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatDuration(cubit.songPosition),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    Text(
                      formatDuration(cubit.songDuration),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.s36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.skip_previous_rounded,
                    size: AppSize.s48,
                    color: context.isDarkMode
                        ? AppColors.grey
                        : AppColors.medGrey.withOpacity(AppSize.s0_75),
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.playOrPause();
                    },
                    child: Container(
                      height: AppSize.s72,
                      width: AppSize.s72,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: Icon(
                        cubit.audioPlayer.playing
                            ? Icons.pause_rounded
                            : Icons.play_arrow,
                        size: AppSize.s48,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.skip_next_rounded,
                    size: AppSize.s48,
                    color: context.isDarkMode
                        ? AppColors.grey
                        : AppColors.medGrey.withOpacity(AppSize.s0_75),
                  ),
                ],
              ),
            ],
          );
        }
        if (state is SongPlayerFailure) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        }
        return Container();
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
