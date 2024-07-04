import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeString = json[AppStrings.themeMode] as String;
    switch (themeString) {
      case AppStrings.system:
        return ThemeMode.system;
      case AppStrings.light:
        return ThemeMode.light;
      case AppStrings.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {AppStrings.themeMode: state.toString().split('.').last};
  }
}
