import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/font_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

import '../functions/responsive_font.dart';


TextStyle _getTextStyle(
  double responsiveFont,
  FontWeight fontWeight,
  Color color,
  double letterSpacing,
  TextOverflow overflow,
) {
  return TextStyle(
    fontSize: responsiveFont,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    overflow: TextOverflow.ellipsis,
  );
}

// regular style
TextStyle getRegularStyle({
  required BuildContext context,
  required Color color,
  double fontSize = FontSize.s12,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.regular,
    color,
    letterSpacing,
    overflow,
  );
}

// medium style

TextStyle getMediumStyle({
  required BuildContext context,
  double fontSize = FontSize.s12,
  required Color color,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.medium,
    color,
    letterSpacing,
    overflow,
  );
}

// light style

TextStyle getLightStyle({
  required BuildContext context,
  double fontSize = FontSize.s12,
  required Color color,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.light,
    color,
    letterSpacing,
    overflow,
  );
}

// bold style

TextStyle getBoldStyle({
  required BuildContext context,
  double fontSize = FontSize.s12,
  required Color color,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.bold,
    color,
    letterSpacing,
    overflow,
  );
}

// semibold style

TextStyle getSemiBoldStyle({
  required BuildContext context,
  double fontSize = FontSize.s12,
  required Color color,
  double letterSpacing = AppSize.s1,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  double responsiveFontSize = responsiveFont(
    context,
    fontSize: fontSize,
  );
  return _getTextStyle(
    responsiveFontSize,
    FontWeightManager.semiBold,
    color,
    letterSpacing,
    overflow,
  );
}
