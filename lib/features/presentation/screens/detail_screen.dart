// The file implements a detailed weather screen

import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/list'),
              icon: const Icon(Icons.list)),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: AppStyles.primaryPadding,
        child: Column(
          children: [
            Text(
              'Краснодар',
              style: AppStyles.boldTextStyle.copyWith(fontSize: 32),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '22°C',
              style: AppStyles.boldTextStyle
                  .copyWith(fontSize: 62, color: AppColors.primaryColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Влажность: 62%',
                  style: AppStyles.mediumTextStyle
                      .copyWith(fontSize: 14, color: AppColors.secondTextColor),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Скорость ветра: 2мс',
                  style: AppStyles.mediumTextStyle
                      .copyWith(fontSize: 14, color: AppColors.secondTextColor),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
