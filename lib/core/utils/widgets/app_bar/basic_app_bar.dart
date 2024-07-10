import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';
import 'package:spotify/core/utils/resources/color_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
    this.title,
    this.hideBack = false,
    this.action,
    this.backgroundColor,
  });

  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: AppDuration.d500),
      child: AppBar(
        backgroundColor: backgroundColor ?? AppColors.transparent,
        title: title ?? const Text(''),
        actions: [
          action ?? Container(),
        ],
        leading: hideBack
            ? null
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  height: AppSize.s64,
                  width: AppSize.s64,
                  decoration: BoxDecoration(
                    color: context.isDarkMode
                        ? AppColors.blackBackBg
                        : AppColors.lightBackBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: AppSize.s16,
                    color:
                        context.isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
