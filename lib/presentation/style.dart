import 'package:flutter/material.dart';

class AppColors {
  static const Color dark = Color.fromARGB(255, 22, 22, 22);
  static const Color backgroundColor = Color.fromARGB(255, 36, 36, 36);
  static const Color greyDark = Color.fromARGB(255, 56, 56, 56);
  static const Color greyLight = Color.fromARGB(127, 255, 255, 255);
  static const Color white = Colors.white;

  static const Color blue = Colors.blue;
}

class AppFontSize {
  static const double h1 = 48;
  static const double h2 = 18;
  static const double h3 = 16;
}

class AppTextStyle {
  static const TextStyle h1White = TextStyle(
    color: AppColors.white,
    fontSize: AppFontSize.h1,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle h1Grey = TextStyle(
    color: AppColors.greyLight,
    fontSize: AppFontSize.h1,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle h2 = TextStyle(
    color: AppColors.white,
    fontSize: AppFontSize.h2,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle h3 = TextStyle(
    color: AppColors.greyLight,
    fontSize: AppFontSize.h3,
  );
}
