import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/font_manager.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

import '../resources/color_manager.dart';
import '../resources/style_manager.dart';

// light theme
ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primary,
    fontFamily: AppStrings.fontFamily,
    brightness: Brightness.light,

    // app bar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: AppColors.transparent,
      elevation: AppSize.s0,
    ),

    // slider theme
    sliderTheme: SliderThemeData(
      overlayShape: SliderComponentShape.noOverlay,
    ),

    // indicator theme
    indicatorColor: AppColors.primary,

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.transparent,
      contentPadding: const EdgeInsets.all(AppPadding.p30),
      hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.medGrey,
            fontSize: FontSize.s16,
          ),

      // error border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r30),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: AppSize.s0_5,
        ),
      ),

      // border theme
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r30),
        borderSide: BorderSide(
          color: AppColors.blackBackBg,
          width: AppSize.s0_5,
        ),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r30),
        borderSide: BorderSide(
          color: AppColors.blackBackBg,
          width: AppSize.s0_5,
        ),
      ),

      // enabled border theme
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r30),
        borderSide: BorderSide(
          color: AppColors.blackBackBg,
          width: AppSize.s0_5,
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

    // snackbar theme
    snackBarTheme: SnackBarThemeData(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: AppPadding.p16).copyWith(
        bottom: AppPadding.p32,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.darkBackground,
      contentTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.white,
            fontSize: FontSize.s16,
          ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r30),
      ),
      elevation: AppSize.s0,
    ),

    // tab bar theme
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.black,
      labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      unselectedLabelColor: AppColors.medGrey.withOpacity(AppSize.s0_5),
      unselectedLabelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const UnderlineTabIndicator(
        insets: EdgeInsets.only(
          left: AppPadding.p12,
          right: AppPadding.p12,
        ),
        borderSide: BorderSide(
          color: AppColors.primary,
          width: AppSize.s2_5,
        ),
      ),
      dividerColor: AppColors.transparent,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.only(
        right: AppPadding.p32,
        bottom: AppPadding.p2,
      ),
      overlayColor: WidgetStateProperty.all(AppColors.transparent),
      splashFactory: InkRipple.splashFactory,
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
        fontSize: FontSize.s14,
      ),

      // title medium
      titleMedium: getRegularStyle(
        context: context,
        fontSize: FontSize.s12,
      ),
    ),
  );
}

// dark theme
ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.primary,
    fontFamily: AppStrings.fontFamily,
    brightness: Brightness.dark,

    // app bar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: AppColors.transparent,
      elevation: AppSize.s0,
    ),

    // indicator theme
    indicatorColor: AppColors.primary,

    // loading indicator theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),

    // slider theme
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.lightGrey,
      inactiveTrackColor: AppColors.greyWithOp,
      thumbColor: AppColors.lightGrey,
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.transparent,
      contentPadding: const EdgeInsets.all(AppPadding.p30),
      hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.grey,
            fontSize: FontSize.s16,
          ),

      // border theme
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r30),
        borderSide: const BorderSide(
          color: AppColors.white,
          width: AppSize.s0_5,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r30),
        borderSide: const BorderSide(
          color: AppColors.white,
          width: AppSize.s0_5,
        ),
      ),

      // enabled border theme
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r30),
        borderSide: const BorderSide(
          color: AppColors.white,
          width: AppSize.s0_5,
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

    // snackbar theme
    snackBarTheme: SnackBarThemeData(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: AppPadding.p16).copyWith(
        bottom: AppPadding.p32,
      ),
      backgroundColor: AppColors.grey,
      contentTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: AppColors.black,
            fontSize: FontSize.s16,
          ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r30),
      ),
      elevation: AppSize.s0,
    ),

    // tab bar theme
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.white,
      labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      unselectedLabelColor: AppColors.grey.withOpacity(AppSize.s0_5),
      unselectedLabelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const UnderlineTabIndicator(
        insets: EdgeInsets.only(
          left: AppPadding.p12,
          right: AppPadding.p12,
        ),
        borderSide: BorderSide(
          color: AppColors.primary,
          width: AppSize.s2_5,
        ),
      ),
      dividerColor: AppColors.transparent,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.only(
        right: AppPadding.p32,
        bottom: AppPadding.p2,
      ),
      overlayColor: WidgetStateProperty.all(AppColors.transparent),
      splashFactory: InkRipple.splashFactory,
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
        fontSize: FontSize.s14,
        color: AppColors.white,
      ),

      // title medium
      titleMedium: getRegularStyle(
        context: context,
        fontSize: FontSize.s12,
      ),
    ),
  );
}
