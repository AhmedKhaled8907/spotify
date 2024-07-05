
import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        AppStrings.forgotPassword,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: context.isDarkMode
                  ? AppColors.grey
                  : AppColors.medGrey.withOpacity(AppSize.s0_75),
            ),
      ),
    );
  }
}
