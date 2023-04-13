// The file implements snack bar

import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';

SnackBar snackBarWidget(
    {required BuildContext context,
    required String message,
    required String pushRouteName,
    required String actionLabel}) {
  // Base snack bar widget
  
  return SnackBar(
    content: Text(
      message,
      style: AppStyles.mediumTextStyle.copyWith(color: AppColors.primaryColor),
    ),
    action: SnackBarAction(
      onPressed: () {
        Navigator.pushNamed(context, pushRouteName);
      },
      label: actionLabel ,
    ),
  );
}
