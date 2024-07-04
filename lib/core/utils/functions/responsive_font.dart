// scale factor
// responsive font size
// (min , max)font size
import 'package:flutter/material.dart';

double responsiveFont(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFont = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFont.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
