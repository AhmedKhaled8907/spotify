import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: 0.0,
          min: 0.0,
          max: 0.0,
          onChanged: (value) {
            return;
          },
        ),
        const SizedBox(height: AppSize.s4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '00:00',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '00:00',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: AppSize.s36),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous_rounded,
              size: AppSize.s48,
              color: context.isDarkMode
                  ? AppColors.grey
                  : AppColors.medGrey.withOpacity(AppSize.s0_75),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: AppSize.s72,
                width: AppSize.s72,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  size: AppSize.s48,
                  color: AppColors.white,
                ),
              ),
            ),
            Icon(
              Icons.skip_next_rounded,
              size: AppSize.s48,
              color: context.isDarkMode
                  ? AppColors.grey
                  : AppColors.medGrey.withOpacity(AppSize.s0_75),
            ),
          ],
        ),
      ],
    );
  }
}
