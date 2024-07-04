import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/font_manager.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

class BaseAppTheme {
  static ThemeData baseTheme(BuildContext context) => ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: AppStrings.fontFamily,

        // app bar theme
        appBarTheme: const AppBarTheme(
          color: AppColors.transparent,
          elevation: AppSize.s0,
        ),

        // slider theme
        sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
        ),

        // input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.transparent,
          contentPadding: const EdgeInsets.all(AppPadding.p30),
          hintStyle: const TextStyle(
            color: AppColors.medGrey,
            fontWeight: FontWeight.w500,
          ),

          // border theme
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.r30),
            borderSide: const BorderSide(
              color: AppColors.white,
              width: AppSize.s0_4,
            ),
          ),

          // enabled border theme
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.r30),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: AppSize.s0_4,
            ),
          ),
        ),

        // elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            elevation: AppSize.s0,
            textStyle: Theme.of(context).textTheme.headlineMedium,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r30),
            ),
          ),
        ),

        // text button theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.transparent,
            overlayColor: AppColors.darkGrey,
            elevation: AppSize.s0,
            textStyle: Theme.of(context).textTheme.headlineMedium,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r30),
            ),
          ),
        ),

        // text theme
        textTheme: TextTheme(
          // display large
          displayLarge: getBoldStyle(
            context: context,
            fontSize: FontSize.s26,
          ),

          // display medium
          displayMedium: getBoldStyle(
            context: context,
            fontSize: FontSize.s22,
          ),

          // display small
          displaySmall: getMediumStyle(
            context: context,
            fontSize: FontSize.s20,
            color: AppColors.white,
          ),

          // headline large
          headlineLarge: getMediumStyle(
            context: context,
            fontSize: FontSize.s18,
          ),

          // headline medium
          headlineMedium: getBoldStyle(
            context: context,
            fontSize: FontSize.s16,
          ),

          // headline small
          headlineSmall: getRegularStyle(
            context: context,
            fontSize: FontSize.s15,
          ),

          // title large
          titleLarge: getRegularStyle(
            context: context,
            fontSize: FontSize.s12,
          ),
        ),
      );
}

class AppTheme extends BaseAppTheme {
  // light theme
  static ThemeData lightTheme(BuildContext context) {
    final base = BaseAppTheme.baseTheme(context);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.lightBackground,
      brightness: Brightness.light,
    );
  }

  // dark theme
  static ThemeData darkTheme(BuildContext context) {
    final base = BaseAppTheme.baseTheme(context);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.darkBackground,
      brightness: Brightness.dark,

      // slider theme
      sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
        activeTrackColor: AppColors.lightGrey,
        inactiveTrackColor: AppColors.greyWithOp,
        thumbColor: AppColors.lightGrey,
      ),

      // text theme
      textTheme: base.textTheme.copyWith(
        displayLarge: getBoldStyle(
          context: context,
          fontSize: FontSize.s26,
          color: AppColors.white,
        ),
      ),
    );
  }
}
