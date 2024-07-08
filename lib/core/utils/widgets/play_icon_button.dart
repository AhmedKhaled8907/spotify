import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class PlayIconButton extends StatelessWidget {
  const PlayIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: AppSize.s48,
        width: AppSize.s48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.isDarkMode ? AppColors.darkGrey : AppColors.grey,
        ),
        child: Icon(
          Icons.play_arrow_rounded,
          size: AppSize.s36,
          color: context.isDarkMode ? AppColors.grey : AppColors.medGrey,
        ),
      ),
    );
  }
}
