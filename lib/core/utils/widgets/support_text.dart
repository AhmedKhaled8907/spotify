import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/color_manager.dart';

import '../resources/strings_manager.dart';

class SupportText extends StatelessWidget {
  const SupportText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.support,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          AppStrings.clickHere,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.primary,
              ),
        ),
      ],
    );
  }
}
