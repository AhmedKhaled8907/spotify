import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';
import 'package:spotify/core/utils/widgets/favorite_button/favorite_button.dart';
import 'package:spotify/core/utils/widgets/play_icon_button.dart';
import 'package:spotify/features/data/models/song/song_model.dart';
import 'package:spotify/features/presentation/pages/home/bloc/playlist_cubit/playlist_cubit.dart';

import '../../../../../core/utils/constants/custom_loading_indicator.dart';
import '../../../../../core/utils/resources/route_manager.dart';
import '../../../../../core/utils/resources/strings_manager.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaylistCubit()..getPlaylist(),
      child: BlocBuilder<PlaylistCubit, PlaylistState>(
        builder: (context, state) {
          if (state is PlaylistLoading) {
            return const CustomLoadingIndicator();
          }

          if (state is PlaylistSuccess) {
            return _playlistBody(
              songs: state.songs,
              context,
            );
          }

          if (state is PlaylistFailure) {
            return Center(
              child: Text(
                textAlign: TextAlign.center,
                state.message,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _playlistBody(BuildContext context, {required List<SongModel> songs}) {
    return Column(
      children: [
        // Playlist header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.playlist,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                AppStrings.seeMore,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),

        // Playlist body
        const SizedBox(height: AppSize.s24),
        _playlistList(
          songs: songs,
          context,
        ),
      ],
    );
  }

  Widget _playlistList(
    BuildContext context, {
    required List<SongModel> songs,
  }) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: songs.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: AppSize.s16);
      },
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          borderRadius: BorderRadius.circular(AppSize.s16),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.songPlayerRoute,
              arguments: songs[index],
            );
          },
          child: _playlistItem(songs, index, context),
        );
      },
    );
  }

  Row _playlistItem(List<SongModel> songs, int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: AppSize.s3.toInt(),
          child: Row(
            children: [
              const PlayIconButton(),
              const SizedBox(width: AppSize.s24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songs[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: AppSize.s1.toInt(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: AppSize.s4),
                    Text(
                      songs[index].artist,
                      overflow: TextOverflow.ellipsis,
                      maxLines: AppSize.s1.toInt(),
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
                songs[index]
                    .time
                    .toStringAsFixed(AppSelectedIndex.i2)
                    .replaceAll('.', ':'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              FavoriteButton(
                isFavorite: songs[index].isFavorite ?? false,
                songId: songs[index].songId!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
