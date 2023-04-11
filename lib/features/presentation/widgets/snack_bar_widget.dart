// The file implements snack bar

import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';

class SnackBarWidget extends StatelessWidget {

  const SnackBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: const Text(
        'Ошибка получения данных',
        style: AppStyles.mediumTextStyle,
      ),
      action: SnackBarAction(
        onPressed: () {
          Navigator.pop(context);
        }, label: '',
      ),
    );
  }
}
