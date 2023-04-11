// The file contains the common constants for the application

import 'package:flutter/material.dart';

class AppColors {
  // The class contains static color values

  static const Color canvasColor = Color(0xFFF9F5EA);
  static const Color primaryColor = Color(0xFF4169E1);
  static const Color darkenedBackgroundColor = Color(0xFFF0ECE2);
  static const Color primaryTextColor = Color(0xFF2D2D2B);
}

class AppStyles {
  // The class contains static styles

  static const EdgeInsets primaryPadding =
      EdgeInsets.symmetric(horizontal: 40, vertical: 20);

  static const TextStyle boldTextStyle =
      TextStyle(color: AppColors.primaryTextColor, fontWeight: FontWeight.bold);
  static const TextStyle mediumTextStyle =
      TextStyle(color: AppColors.primaryTextColor, fontWeight: FontWeight.w500);
}
