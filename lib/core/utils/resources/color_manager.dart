import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

class AppColors {
  static const Color primary = Color(0xff42C83C);
  static const Color lightBackground = Color(0xFFF2F2F2);
  static const Color darkBackground = Color(0xff1C1B1B);
  static const Color grey = Color(0xffBEBEBE);
  static const Color medGrey = Color(0xff383838);
  static const Color darkGrey = Color(0xff343434);
  static const Color lightGrey = Color(0xffB7B7B7);
  static Color greyWithOp = Colors.grey.withOpacity(0.3);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Colors.black;
  static const Color redAccent = Colors.redAccent;
  static const Color blueAccent = Colors.blueAccent;

  static Color filteredBg = const Color(0x0fffffff).withOpacity(AppSize.s0_03);
  static Color blackWithOp = Colors.black.withOpacity(AppSize.s0_3);
  static Color blackBackBg = Colors.black.withOpacity(AppSize.s0_4);
  static Color lightBackBg = Colors.grey.withOpacity(AppSize.s0_2);
  static const Color transparent = Colors.transparent;
}
