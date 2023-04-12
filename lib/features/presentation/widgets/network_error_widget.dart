import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';

class NetworkErrorWidget extends StatelessWidget {
  final String? errorMessage;

  const NetworkErrorWidget({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage ?? AppTexts.errorNetworkMessage,
        style: AppStyles.boldTextStyle.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
