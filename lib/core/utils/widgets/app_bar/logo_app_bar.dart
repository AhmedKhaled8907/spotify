
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets.dart';
import '../../resources/values_manager.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: FadeInRight(
        duration: const Duration(milliseconds: AppDuration.d500),
        child: SvgPicture.asset(
          Assets.vectorsSpotifyLogo,
          width: AppSize.s40,
          height: AppSize.s40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
