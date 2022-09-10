import 'package:flutter/material.dart';

import 'colors.dart';

mixin AppStyles {
  static final TextStyle title = TextStyle(
    color: AppColors.kBlackColor.withOpacity(.8),
    fontSize: 35,
    fontWeight: FontWeight.w700,
  );
  static final kBoldWhiteStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  static TextStyle kCustomStyle(
          Color color, double fontSize, FontWeight fontWeight) =>
      TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize);
}
