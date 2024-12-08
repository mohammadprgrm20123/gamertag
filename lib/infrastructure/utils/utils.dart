import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class Utils {
  static const double tinySpace = 4;
  static const double smallSpace = 8;
  static const double mediumSpace = 16;
  static const double largeSpace = 24;
  static const double giantSpace = 32;

  static const Widget tinyGap = Gap(tinySpace);
  static const Widget smallGap = Gap(smallSpace);
  static const Widget mediumGap = Gap(mediumSpace);
  static const Widget largeGap = Gap(largeSpace);
  static const Widget giantGap = Gap(giantSpace);

  static const EdgeInsetsDirectional tinyPadding =
      EdgeInsetsDirectional.all(tinySpace);
  static const EdgeInsetsDirectional smallPadding =
      EdgeInsetsDirectional.all(smallSpace);
  static const EdgeInsetsDirectional mediumPadding =
      EdgeInsetsDirectional.all(mediumSpace);
  static const EdgeInsetsDirectional largePadding =
      EdgeInsetsDirectional.all(largeSpace);
  static const EdgeInsetsDirectional giantPadding =
      EdgeInsetsDirectional.all(giantSpace);


}
