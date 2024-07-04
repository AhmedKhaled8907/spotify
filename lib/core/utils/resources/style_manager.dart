import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/font_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

import '../functions/responsive_font.dart';

TextStyle _getTextStyle(
  double responsiveFont,
  FontWeight fontWeight,
  double letterSpacing,
  TextOverflow overflow,
  Color? color,
) {
  return TextStyle(
    fontSize: responsiveFont,
    fontFamily: FontConstants.fontFamily,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    overflow: TextOverflow.ellipsis,
    color: color,
  );
}

// regular style
TextStyle getRegularStyle({
  required BuildContext context,
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
  Color? color,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.regular,
    letterSpacing,
    overflow,
    color,
  );
}

// medium style

TextStyle getMediumStyle({
  required BuildContext context,
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
  Color? color,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.medium,
    letterSpacing,
    overflow,
    color,
  );
}

// light style

TextStyle getLightStyle({
  required BuildContext context,
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
  Color? color,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.light,
    letterSpacing,
    overflow,
    color,
  );
}

// bold style

TextStyle getBoldStyle({
  required BuildContext context,
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
  Color? color,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.bold,
    letterSpacing,
    overflow,
    color,
  );
}

// semibold style

TextStyle getSemiBoldStyle({
  required BuildContext context,
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
  Color? color,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.semiBold,
    letterSpacing,
    overflow,
    color,
  );
}
