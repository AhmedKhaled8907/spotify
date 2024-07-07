import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/utils/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify/features/presentation/pages/home/pages/home_tabs.dart';

import '../../../../../core/utils/constants/assets.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import '../../../../../core/utils/widgets/app_logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: AppLogo(),
        hideBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p24,
            horizontal: AppPadding.p24,
          ),
          child: Column(
            children: [
              _homeTopCard(),
              const SizedBox(height: AppSize.s30),
              const HomeTabs(),
              const SizedBox(height: AppSize.s30),
            ],
          ),
        ),
      ),
    );
  }

  Stack _homeTopCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset(
            Assets.vectorsHomeTopCard,
          ),
        ),
        Positioned(
          bottom: AppSize.s0,
          right: AppSize.s0,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: AppPadding.p32,
              ),
              child: Image.asset(
                Assets.imagesHomeArtist,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
