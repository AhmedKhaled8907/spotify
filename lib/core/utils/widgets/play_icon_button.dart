import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class PlayIconButton extends StatelessWidget {
  const PlayIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.none,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: AppSize.s36,
          width: AppSize.s36,
          transform: Matrix4.translationValues(
            -AppSize.s12,
            AppSize.s12,
            AppSize.s0,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode ? AppColors.darkGrey : AppColors.grey,
          ),
          child: Icon(
            Icons.play_arrow_rounded,
            color: context.isDarkMode ? AppColors.grey : AppColors.medGrey,
          ),
        ),
      ),
    );
  }
}
