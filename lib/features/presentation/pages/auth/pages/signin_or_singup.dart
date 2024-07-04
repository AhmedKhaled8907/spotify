import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/utils/constants/assets.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';
import 'package:spotify/core/utils/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify/core/utils/widgets/basic_app_button.dart';
import 'package:spotify/core/utils/widgets/basic_text_button.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/strings_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';

class SignInOrSignUpPage extends StatelessWidget {
  const SignInOrSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          // top pattern
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              Assets.vectorsTopPattern,
            ),
          ),

          // bottom right pattern
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              Assets.vectorsBottomPattern,
            ),
          ),

          // bottom left pattern
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              Assets.imagesAuthBg,
            ),
          ),

          // content section
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s24,
              ).copyWith(
                bottom: AppPadding.p64,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.vectorsSpotifyLogo,
                    width: AppSize.s250,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: AppSize.s56),
                  Text(
                    AppStrings.enjoy,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: AppSize.s24),

                  // get started text
                  Text(
                    AppStrings.signInText,
                    textAlign: TextAlign.center,
                    maxLines: AppSize.s5.toInt(),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: context.isDarkMode
                              ? AppColors.grey
                              : AppColors.darkGrey,
                        ),
                  ),
                  const SizedBox(height: AppSize.s36),

                  //buttons section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: AppFlex.f1,
                        child: BasicAppButton(
                          onPressed: () {},
                          title: AppStrings.register,
                        ),
                      ),
                      const SizedBox(width: AppSize.s4),
                      Expanded(
                        flex: AppFlex.f1,
                        child: BasicTextButton(
                          onPressed: () {},
                          title: AppStrings.signIn,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
