import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';
import 'package:spotify/core/utils/resources/color_manager.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/widgets/basic_divider.dart';

class OrWithDividers extends StatelessWidget {
  const OrWithDividers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BasicDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            AppStrings.or,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color:
                      context.isDarkMode ? AppColors.grey : AppColors.darkGrey,
                ),
          ),
        ),
        const BasicDivider(),
      ],
    );
  }
}
