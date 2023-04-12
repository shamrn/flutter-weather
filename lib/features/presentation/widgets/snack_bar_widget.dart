// The file implements snack bar

import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';

SnackBar errorSnackBarWidget(
    {required BuildContext context, required String errorMessage}) {
  return SnackBar(
    content: Text(
      errorMessage,
      style: AppStyles.mediumTextStyle.copyWith(color: AppColors.primaryColor),
    ),
    action: SnackBarAction(
      onPressed: () {
        Navigator.pop(context);
      },
      label: 'Назад',
    ),
  );
}
