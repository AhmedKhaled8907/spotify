import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/assets.dart';
import '../resources/values_manager.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.vectorsSpotifyLogo,
      width: AppSize.s40,
      height: AppSize.s40,
      fit: BoxFit.cover,
    );
  }
}
