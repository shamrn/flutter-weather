// The file contains the common constants for the application

import 'package:flutter/material.dart';

class AppColors {
  // The class contains static color values

  static const Color canvasColor = Color(0xFFF9F5EA);
  static const Color primaryColor = Color(0xFF4169E1);
  static const Color darkenedBackgroundColor = Color(0xFFF0ECE2);
  static const Color primaryTextColor = Color(0xFF2D2D2B);
  static const Color secondTextColor = Color(0xFF6F6F6F);
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

class AppApi {
  // The class contains static data for API

  static const String weatherUrl = 'api.weatherapi.com';
  static const String weatherApiVersion = 'v1';
  static const String weatherApiEndpoint = 'forecast.json';
  static const String weatherApiKey = '4d8d0904eea84b3ba75144357231104';
}

class AppTexts {
  // The class contains static texts

  static const String errorNetworkMessage = 'Ошибка получения данных';
  static const String validationRequiredFieldText = 'Обязательное поле';
}
