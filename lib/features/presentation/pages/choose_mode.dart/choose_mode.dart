
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/features/presentation/pages/choose_mode.dart/choose_mode_item.dart';

import '../../../../core/utils/constants/assets.dart';
import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../../core/utils/widgets/basic_app_button.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Container(
            color: AppColors.blackWithOp,
          ),

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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ChooseModeItem(
                        image: Assets.vectorsSun,
                        title: AppStrings.lightMode,
                        onTap: () {},
                      ),
                      ChooseModeItem(
                        image: Assets.vectorsMoon,
                        title: AppStrings.darkMode,
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSize.s48),

                  // get started button
                  BasicAppButton(
                    title: AppStrings.continueBtn,
                    onPressed: () {
                      // TODO: navigate to Sign In
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const ChooseModePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

