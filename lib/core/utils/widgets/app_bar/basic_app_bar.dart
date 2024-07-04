import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';
import 'package:spotify/core/utils/resources/color_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: AppSize.s50,
          width: AppSize.s50,
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? AppColors.blackBackBg
                : AppColors.lightBackBg,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: AppSize.s16,
            color: context.isDarkMode ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
