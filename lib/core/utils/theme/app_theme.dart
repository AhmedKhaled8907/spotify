import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/font_manager.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

ThemeData appTheme(BuildContext context) {
  // light theme
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: AppStrings.fontFamily,

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
        textStyle: const TextStyle(
          fontSize: FontSize.s16,
          fontWeight: FontWeight.bold,
        ),
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
        fontSize: FontSize.s24,
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

  // // dark theme
  // static final darkTheme = ThemeData(
  //   primaryColor: AppColors.primary,
  //   scaffoldBackgroundColor: AppColors.darkBackground,
  //   brightness: Brightness.dark,
  //   fontFamily: AppStrings.fontFamily,

  //   // slider theme
  //   sliderTheme: SliderThemeData(
  //     overlayShape: SliderComponentShape.noOverlay,
  //     activeTrackColor: AppColors.lightGrey,
  //     inactiveTrackColor: AppColors.greyWithOp,
  //     thumbColor: AppColors.lightGrey,
  //   ),

  //   // input decoration theme
  //   inputDecorationTheme: InputDecorationTheme(
  //     filled: true,
  //     fillColor: AppColors.transparent,
  //     hintStyle: const TextStyle(
  //       color: Color(0xffA7A7A7),
  //       fontWeight: FontWeight.w500,
  //     ),
  //     contentPadding: const EdgeInsets.all(AppPadding.p30),
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(AppRadius.r30),
  //       borderSide: const BorderSide(
  //         color: AppColors.white,
  //         width: AppSize.s0_4,
  //       ),
  //     ),

  //     // enabled border theme
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(AppRadius.r30),
  //       borderSide: const BorderSide(
  //         color: AppColors.white,
  //         width: AppSize.s0_4,
  //       ),
  //     ),
  //   ),

  //   // elevated button theme
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: AppColors.primary,
  //       elevation: AppSize.s0,
  //       textStyle: const TextStyle(
  //         fontSize: FontSize.s16,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(AppRadius.r30),
  //       ),
  //     ),
  //   ),

  // // text theme
  //   textTheme: TextTheme(
  //     // display large
  //     displayLarge: getBoldStyle(
  //       context: context,
  //       fontSize: FontSize.s24,
  //     ),

  //     // display medium
  //     displayMedium: getBoldStyle(
  //       context: context,
  //       fontSize: FontSize.s22,
  //     ),

  //     // display small
  //     displaySmall: getMediumStyle(
  //       context: context,
  //       fontSize: FontSize.s20,
  //     ),

  //     // headline large
  //     headlineLarge: getMediumStyle(
  //       context: context,
  //       fontSize: FontSize.s18,
  //     ),

  //     // headline medium
  //     headlineMedium: getBoldStyle(
  //       context: context,
  //       fontSize: FontSize.s16,
  //     ),

  //     // headline small
  //     headlineSmall: getRegularStyle(
  //       context: context,
  //       fontSize: FontSize.s15,
  //     ),

  //     // title large
  //     titleLarge: getRegularStyle(
  //       context: context,
  //       fontSize: FontSize.s12,
  //     ),
  //   ),

  // );
}
