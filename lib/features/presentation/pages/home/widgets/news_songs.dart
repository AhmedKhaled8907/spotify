import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/utils/constants/custom_loading_indicator.dart';
import 'package:spotify/core/utils/resources/constants_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';
import 'package:spotify/features/presentation/pages/home/bloc/news_songs_cubit/news_songs_cubit.dart';
import '../../../../../core/utils/widgets/play_icon_button.dart';
import '../../../../data/models/song/song_model.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: AppSize.s200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return const CustomLoadingIndicator();
            }

            if (state is NewsSongsSuccess) {
              return _newsSongsBody(songs: state.songs);
            }

            if (state is NewsSongsFailure) {
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
      ),
    );
  }

  Widget _newsSongsBody({required List<SongModel> songs}) {
    return SizedBox(
      height: AppSize.s200,
      child: ListView.separated(
        itemCount: songs.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: AppSize.s16);
        },
        itemBuilder: (BuildContext context, int index) {
          return _songCard(model: songs[index], context);
        },
      ),
    );
  }

  Widget _songCard(BuildContext context, {required SongModel model}) {
    final imageUrl = AppUrl.fireStoreImage(model.artist);

    return SizedBox(
      width: AppSize.s160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s30),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: const PlayIconButton(),
            ),
          ),
          const SizedBox(height: AppSize.s8),
          Text(
            model.title,
            style: Theme.of(context).textTheme.headlineMedium,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            model.artist,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
