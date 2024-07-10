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
import 'package:spotify/features/presentation/pages/profile/cubit/profile_info_cubit.dart';

import '../../../../../core/utils/resources/values_manager.dart';

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
        body: _buildBody(context),
      ),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: FadeInRight(
        duration: const Duration(milliseconds: AppDuration.d500),
        child: Column(
          children: [
            _profileInfo(context),
          ],
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
}
