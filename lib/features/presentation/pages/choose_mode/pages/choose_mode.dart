import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';
import 'package:spotify/features/presentation/pages/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify/features/presentation/pages/choose_mode/widgets/choose_mode_item.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/route_manager.dart';
import '../../../../../core/utils/resources/strings_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../../../../core/utils/widgets/basic_app_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInRight(
        duration: const Duration(milliseconds: AppDuration.d500),
        child: Stack(
          children: [
            // background image
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesChooseModeBg),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            // black overlay
            context.isDarkMode
                ? Container(color: AppColors.blackWithOp)
                : Container(),

            // content section
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s36,
                ).copyWith(
                  bottom: AppPadding.p64,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // logo image
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        Assets.vectorsSpotifyLogo,
                      ),
                    ),
                    const Spacer(),

                    // choose mode
                    Text(
                      AppStrings.chooseMode,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                    const SizedBox(height: AppSize.s48),

                    // get started text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ChooseModeItem(
                          image: Assets.vectorsMoon,
                          title: AppStrings.darkMode,
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.dark);
                          },
                        ),
                        ChooseModeItem(
                          image: Assets.vectorsSun,
                          title: AppStrings.lightMode,
                          onTap: () {
                            context
                                .read<ThemeCubit>()
                                .updateTheme(ThemeMode.light);
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSize.s48),

                    // get started button
                    BasicAppButton(
                      title: AppStrings.continueBtn,
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.signinOrSignupRoute,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
