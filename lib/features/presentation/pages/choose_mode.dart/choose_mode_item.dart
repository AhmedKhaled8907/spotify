import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';

class ChooseModeItem extends StatelessWidget {
  const ChooseModeItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: AppSize.s10,
                sigmaY: AppSize.s10,
              ),
              child: Container(
                width: AppSize.s80,
                height: AppSize.s80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.filteredBg,
                ),
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s16),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
