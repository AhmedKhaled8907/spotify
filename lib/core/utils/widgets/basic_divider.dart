import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';

import '../resources/color_manager.dart';

class BasicDivider extends StatelessWidget {
  const BasicDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        thickness: 0.5,
        color: context.isDarkMode ? AppColors.grey : AppColors.darkGrey,
      ),
    );
  }
}
