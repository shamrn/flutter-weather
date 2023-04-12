// The file implements card widget

import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';

class CardWidget extends StatelessWidget {
  final double height;
  final String date;
  final String temp;
  final String humidity;
  final String wind;

  const CardWidget({
    Key? key,
    required this.height,
    required this.date,
    required this.temp,
    required this.humidity,
    required this.wind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.darkenedBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: AppStyles.mediumTextStyle.copyWith(fontSize: 18),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                '$temp°C',
                style: AppStyles.boldTextStyle
                    .copyWith(fontSize: 48, color: AppColors.primaryColor),
              ),
            ),
            Column(
              children: [
                _alignSmallText(
                    text: 'Влажность: $humidity%',
                    alignment: Alignment.topLeft),
                const SizedBox(
                  height: 5,
                ),
                _alignSmallText(
                    text: 'Скорость ветра: $windмс',
                    alignment: Alignment.topLeft)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _alignSmallText({required String text, required Alignment alignment}) {
    // The method returns a small text, also sets its alignment

    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: AppStyles.boldTextStyle
            .copyWith(fontSize: 12, color: AppColors.secondTextColor),
      ),
    );
  }
}
