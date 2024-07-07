import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/utils/resources/color_manager.dart';
import 'package:spotify/core/utils/resources/font_manager.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/resources/route_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../../../../core/utils/widgets/basic_app_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
                    image: AssetImage(Assets.imagesIntroBg),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            // content section
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s40,
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

                    // enjoy text
                    Text(
                      AppStrings.enjoy,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            color: AppColors.white,
                            fontSize: FontSize.s24,
                          ),
                    ),
                    const SizedBox(height: AppSize.s24),

                    // get started text
                    Text(
                      AppStrings.getStartedText,
                      textAlign: TextAlign.center,
                      maxLines: AppSize.s5.toInt(),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: AppColors.grey,
                              ),
                    ),
                    const SizedBox(height: AppSize.s36),

                    // get started button
                    BasicAppButton(
                      title: AppStrings.getStarted,
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          AppRoutes.chooseModeRoute,
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
