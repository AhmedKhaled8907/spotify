import 'package:flutter/material.dart';
import 'package:spotify/core/utils/extensions/is_dark_mode.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

class BasicTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const BasicTextButton({
    required this.onPressed,
    required this.title,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? AppSize.s80),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
      ),
    );
  }
}
